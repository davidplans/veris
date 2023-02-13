import 'dart:convert';

import 'package:Veris/core/models/study_module_model.dart';
import 'package:Veris/core/models/study_section_model.dart';
import 'package:Veris/core/utils/study_module_db_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModuleForHomePage {
  final int id;
  final String type;
  final String name;
  final dynamic options;
  final List<StudySection>? sections;

  ModuleForHomePage(this.id, this.type, this.name,
      [this.options, this.sections]);
}

class StudyProtocolFetchResult {
  final bool status;
  final String? error;
  final String? studyId;
  final String? result;

  StudyProtocolFetchResult(this.status, this.error,
      [this.studyId, this.result]);
}

class StudyProtocolHelper {
  final dbProvider = ModuleDatabaseProvider();

  static Future<StudyProtocolFetchResult> fetchDataFromStudyProtocol(
      String url) async {
    Dio dio = Dio();

    try {
      final fetchDataResponse = await dio.get(
        url,
        options: Options(
          responseType: ResponseType.json,
        ),
      );

      if (fetchDataResponse.headers.value('content-type') !=
          'application/json') {
        return StudyProtocolFetchResult(
          false,
          'The file has the wrong format, only JSON is supported!',
        );
      }

      final decodingFile = await jsonDecode(fetchDataResponse.toString());
      final studyId = decodingFile["properties"]["study_id"];

      if (studyId.isEmpty) {
        return StudyProtocolFetchResult(
          false,
          'Study protocol does not contain STUDY ID',
        );
      }

      return StudyProtocolFetchResult(
        true,
        null,
        studyId,
        jsonEncode(decodingFile),
      );
    } catch (e) {
      return StudyProtocolFetchResult(
        false,
        'Bad request, please re-check your URL',
      );
    }
  }

  Future<bool> saveDataToLocalDB(
    StudyProtocolFetchResult studyProtocol,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('studyId');
    await dbProvider.deleteAllStudyModules();
    await dbProvider.deleteAllStudySections();

    Map parsedJson = jsonDecode(studyProtocol.result ?? '');
    saveGeneralDataForStudyProtocol(parsedJson, prefs, studyProtocol);

    final modules = List.from((parsedJson['modules']));

    for (var item in modules) {
      StudyModule studyModule = prepareModuleForSaving(item, studyProtocol);
      print(studyModule);
      final createdModuleId =
          await dbProvider.addStudyModuleToDatabase(studyModule);

      await addSectionsForModule(item, createdModuleId);
    }

    return true;
  }

  Future<List<ModuleForHomePage>> getAllAvailableModulesWithSections() async {
    List<ModuleForHomePage> result = [];
    final allSaved = await dbProvider.getAllStudyModules();

    for (var module in allSaved) {
      final sections = await dbProvider.getAllStudySectionsByModuleId(
        module.id.toString(),
      );

      final forHomeItem = ModuleForHomePage(
        module.id!,
        module.type,
        module.name,
        jsonDecode(module.options!),
        sections,
      );
      result.add(forHomeItem);
    }
    return result;
  }

  void saveGeneralDataForStudyProtocol(
    Map<dynamic, dynamic> parsedJson,
    SharedPreferences prefs,
    StudyProtocolFetchResult studyProtocol,
  ) {
    Map<String, dynamic> prop = parsedJson['properties'];
    prefs.setString('studyId', studyProtocol.studyId.toString());
    prefs.setString('study_name', prop['study_name']);
    prefs.setString('study_id', prop['study_id']);
    prefs.setString('created_by', prop['created_by']);
    prefs.setString('instructions', prop['instructions']);
    prefs.setString('empty_msg', prop['empty_msg']);
    prefs.setString('support_url', prop['support_url']);
    prefs.setString('support_email', prop['support_email']);
    prefs.setString('ethics', prop['ethics']);
    prefs.setString('pls', prop['pls']);
    prefs.setString('banner_url', prop['banner_url']);
  }

  StudyModule prepareModuleForSaving(
      item, StudyProtocolFetchResult studyProtocol) {
    final String uuid = item['uuid'].toString();
    final String name = item['name'].toString();
    final String type = item['type'].toString();
    final String condition = item['condition'].toString();
    final String alerts = jsonEncode(item['alerts']);
    final String unlockAfter = jsonEncode(item['unlockAfter']);
    final String options = jsonEncode(item['options']);

    final studyModule = StudyModule(
      studyId: studyProtocol.studyId.toString(),
      uuid: uuid,
      name: name,
      type: type,
      condition: condition,
      alerts: alerts,
      unlockAfter: unlockAfter,
      options: options,
    );
    return studyModule;
  }

  Future<void> addSectionsForModule(module, int createdModuleId) async {
    try {
      List? sections;
      if (module['sections'] != null) {
        sections = List.from(module['sections']);
      } else {
        sections = null;
      }

      for (var section in sections!) {
        final String name = section['name'].toString();
        final studySection = StudySection(
          moduleId: createdModuleId.toString(),
          name: name,
          questions: jsonEncode(section['questions']),
          completedAt: '',
        );
        final id = await dbProvider.addStudySectionToDatabase(studySection);
      }
    } catch (e) {}
  }

  Future<bool> getAndSaveStudyProtocol(context, String url) async {
    if (url.isEmpty) {
      return false;
    }

    OverlayLoadingProgress.start(context);
    final res = await StudyProtocolHelper.fetchDataFromStudyProtocol(url);
    OverlayLoadingProgress.stop();

    if (!res.status) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red[200],
        content: Text(res.error.toString()),
      ));
      return false;
    }

    await saveDataToLocalDB(res);

    // await setupLocalPushAlert(res);

    return true;
  }
}
