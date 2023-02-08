import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudyProtocolFetchResult {
  final bool status;
  final String? error;
  final String? studyId;
  final String? result;

  StudyProtocolFetchResult(this.status, this.error,
      [this.studyId, this.result]);
}

class StudyProtocolHelper {
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

  static Future<bool> saveStudyProtocol(context, String url) async {
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

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('studyId', res.studyId.toString());
    await prefs.setString('json_file', res.result.toString());

    return true;
  }
}
