import 'dart:convert';

import 'package:Veris/core/models/study_module_model.dart';
import 'package:Veris/core/models/study_section_model.dart';
import 'package:Veris/core/utils/study_module_db_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

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
    await cleanInfoAboutCurrentStudyProtocol(prefs);

    Map parsedJson = jsonDecode(studyProtocol.result ?? '');

    final generatedTasks = generateStudyTasks(parsedJson);

    for (dynamic item in generatedTasks) {
      final task = StudyTask(
        uuid: item["uuid"],
        moduleIndex: item["moduleIndex"],
        studyId: parsedJson["properties"]["study_id"],
        name: item["name"],
        type: item["type"],
        hidden: item["hidden"],
        unlockAfter: jsonEncode(item["unlockAfter"]),
        sticky: item["sticky"] ? 1 : 0,
        stickyLabel: item["stickyLabel"],
        alertTitle: item["alertTitle"],
        alertMessage: item["alertMessage"],
        timeout: item["timeout"] ? 1 : 0,
        timeoutAfter: item["timeoutAfter"],
        time: item["time"],
        locale: item["locale"],
        completed: 0,
        options: jsonEncode(item["options"]),
      );
      final createdTaskId = await dbProvider.addStudyTaskToDatabase(task);
      await addSectionsForModule(item, createdTaskId);
    }

    saveGeneralDataForStudyProtocol(parsedJson, prefs, studyProtocol);

    return true;
  }

  Future<void> cleanInfoAboutCurrentStudyProtocol(
      SharedPreferences prefs) async {
    prefs.remove('studyId');
    await dbProvider.deleteAllStudyTasks();
    await dbProvider.deleteAllStudySections();
  }

  Future<List<ModuleForHomePage>> getAllAvailableModulesWithSections() async {
    List<ModuleForHomePage> result = [];
    // final allSaved = await dbProvider.getAllStudyTasks();
    final availableTasks = await getTaskDisplayList();
    print(availableTasks);

    for (var module in availableTasks) {
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

  /// Creates a list of tasks (e.g. surveys, interventions) based on their alert schedules
  /// studyObject: A JSON object that contains all data about a study
  List<Map<String, dynamic>> generateStudyTasks(
      Map<dynamic, dynamic> studyObject) {
    // allocate the participant to a study condition
    int min = 1;
    int max = studyObject["properties"]["conditions"].length;
    int conditionIndex = (Random().nextInt(max - min + 1) + min) - 1;
    String condition = studyObject["properties"]["conditions"][conditionIndex];

    List<Map<String, dynamic>> studyTasks = [];

    // the ID for a task
    int taskID = 101;

    // loop through all of the modules in this study
    // and create the associated study tasks based
    // on the alert schedule
    for (int i = 0; i < studyObject["modules"].length; i++) {
      Map<String, dynamic> mod = studyObject["modules"][i];

      // if the module is assigned to the participant's condition
      // add it to the list, otherwise just skip it
      if (mod["condition"] == condition || mod["condition"] == "*") {
        dynamic moduleUuid = mod["uuid"] ?? -1;
        dynamic moduleDuration = mod["alerts"]["duration"];
        dynamic moduleOffset = mod["alerts"]["start_offset"];
        List<dynamic> moduleUnlockAfter = mod["unlock_after"] ?? [];
        bool moduleRandom = mod["alerts"]["random"];
        bool moduleSticky = mod["alerts"]["sticky"];
        String moduleStickyLabel = mod["alerts"]["sticky_label"];
        dynamic moduleTimeout = mod["alerts"]["timeout"];
        dynamic moduleTimeoutAfter = mod["alerts"]["timeout_after"];
        dynamic moduleRandomInterval = mod["alerts"]["random_interval"];
        List<Map<dynamic, dynamic>> moduleTimes =
            List<Map<dynamic, dynamic>>.from(mod["alerts"]["times"]);
        String alertTitle = mod["alerts"]["title"];
        String alertMessage = mod["alerts"]["message"];

        String moduleType = mod["type"];
        // if (mod["type"] == "survey") moduleType = "checkmark-circle-outline";
        // if (mod["type"] == "video") moduleType = "film-outline";
        // if (mod["type"] == "audio") moduleType = "headset-outline";
        // if (mod["type"] == "info") moduleType = "bulb-outline";

        String moduleName = studyObject["modules"][i]["name"];
        int moduleIndex = i;

        DateTime startDay = DateTime.now();
        startDay = DateTime(startDay.year, startDay.month,
            startDay.day); // set the time to midnight

        // add offset days to get first day of alerts
        startDay = startDay.add(Duration(days: moduleOffset));

        // counter to be used when scheduling sticky tasks with notifications
        int stickyCount = 0;

        for (int numDays = 0; numDays < moduleDuration; numDays++) {
          // for each alert time, get the hour and minutes and if necessary randomize it
          for (int t = 0; t < moduleTimes.length; t++) {
            dynamic hours = moduleTimes[t]["hours"];
            dynamic mins = moduleTimes[t]["minutes"];

            DateTime taskTime = DateTime(
                startDay.year, startDay.month, startDay.day, hours, mins);

            if (moduleRandom) {
              // remove the randomInterval from the time
              taskTime =
                  taskTime.subtract(Duration(minutes: moduleRandomInterval));

              // calc a random number between 0 and (randomInterval * 2)
              // to account for randomInterval either side
              double randomMinutes =
                  Random().nextDouble() * ((moduleRandomInterval * 2) - 0) + 0;

              // add the random number of minutes to the dateTime
              taskTime = taskTime.add(Duration(minutes: randomMinutes.toInt()));
            }

            // create a task object
            DateFormat formatter = DateFormat('EEE, MMM d, y, hh:mm a');
            Map<String, dynamic> taskObj = {
              'uuid': moduleUuid,
              'moduleIndex': moduleIndex,
              'taskId': taskID,
              'name': moduleName,
              'type': moduleType,
              'hidden': (moduleSticky && stickyCount == 0) ? 0 : 1,
              'unlockAfter': moduleUnlockAfter,
              'sticky': moduleSticky,
              'stickyLabel': moduleStickyLabel,
              'alertTitle': alertTitle,
              'alertMessage': alertMessage,
              'timeout': moduleTimeout,
              'timeoutAfter': moduleTimeoutAfter,
              'time': taskTime.toString(),
              'locale': formatter.format(taskTime),
              'sections': mod["sections"],
              'options': mod["options"]
            };

            studyTasks.add(taskObj);

            // increment task id
            taskID++;

            // increment the sticky count
            stickyCount++;
          }

          // as a final step increment the date by 1 to set for next day
          startDay = startDay.add(const Duration(days: 1));
        }
      }
    }

    studyTasks.sort((a, b) {
      final dateA = DateTime.parse(a['time']);
      final dateB = DateTime.parse(b['time']);
      return dateA.compareTo(dateB);
    });

    return studyTasks;
  }

  Future<List<dynamic>> getTaskDisplayList() async {
    List<dynamic> studyTasks = await dbProvider.getAllStudyTasks();

    List<dynamic> tasksToDisplay = [];
    List<dynamic> stickyTasks = [];
    List<dynamic> timeTasks = [];

    String lastHeader = "";

    for (var i = 0; i < studyTasks.length; i++) {
      StudyTask task = studyTasks[i];
      // check if task has a preReq
      bool unlocked = checkTaskIsUnlocked(task, studyTasks);
      DateTime alertTime = DateTime.parse(task.time);
      DateTime now = DateTime.now();

      if (now.isAfter(alertTime) && unlocked) {
        if (task.timeout == 1) {
          print(unlocked);
          print(task.timeout);
          DateTime timeoutTime = DateTime.parse(task.time);
          timeoutTime =
              timeoutTime.add(Duration(milliseconds: task.timeoutAfter));

          if (now.isBefore(timeoutTime) && task.completed == 0) {
            timeTasks.add(task);
          }
        } else if (task.completed == 0) {
          timeTasks.add(task);
        }

        // TODO disscuss and if it needed implement sticky logic
        // if (task.sticky == 1) {
        //   if (task.hidden == 0) {
        //     if (lastHeader != task.stickyLabel) {
        //       // push a new header into the stickyTasks array
        //       Map<String, String> header = {
        //         'type': 'header',
        //         'label': task.stickyLabel.toString()
        //       };
        //       stickyTasks.add(header);
        //       lastHeader = task.stickyLabel.toString();
        //     }
        //     // push the sticky task
        //     stickyTasks.add(task);
        //   }
        // } else {
        //   // check if task is set to timeout
        //   if (task.timeout == 1) {
        //     print(unlocked);
        //     print(task.timeout);
        //     DateTime timeoutTime = DateTime.parse(task.time);
        //     timeoutTime =
        //         timeoutTime.add(Duration(milliseconds: task.timeoutAfter));

        //     if (now.isBefore(timeoutTime) && task.completed == 0) {
        //       timeTasks.add(task);
        //     }
        //   } else if (task.completed == 0) {
        //     timeTasks.add(task);
        //   }
        // }
      }
    }

    print(timeTasks);
    // reverse the timeTasks list so newest is displayed first
    if (timeTasks.isNotEmpty) {
      timeTasks = List<dynamic>.from(timeTasks.reversed);
      // Map<String, String> header = {'type': 'header', 'label': 'Recent'};
      // timeTasks.insert(0, header);
    }
    // merge the timeTasks array with the stickyTasks array
    tasksToDisplay = timeTasks + stickyTasks;
    // return the tasks list reversed to ensure correct order
    return List<dynamic>.from(tasksToDisplay.reversed);
  }

  bool checkTaskIsUnlocked(StudyTask task, List<dynamic> studyTasks) {
    // get a set of completed task uuids
    Set<String> completedUUIDs = Set<String>();
    for (StudyTask studyTask in studyTasks) {
      // studyTask['completed']
      if (studyTask.completed != 1) {
        completedUUIDs.add(studyTask.uuid);
      }
    }

    // get the list of prereqs from the task
    List<String> prereqs = List<String>.from(jsonDecode(task.unlockAfter));
    bool unlock = true;
    for (String prereq in prereqs) {
      if (!completedUUIDs.contains(prereq)) {
        unlock = false;
        break;
      }
    }

    return unlock;
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
    } catch (e) {
      print(e);
    }
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
