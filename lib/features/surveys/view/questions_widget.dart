import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/surveys/view/custom_instruction_view.dart';
import 'package:Veris/features/surveys/view/custom_question_step.dart';
import 'package:Veris/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_kit/survey_kit.dart' as kit;
import 'package:survey_kit/survey_kit.dart';

// TODO: refactoring here!!!!!!!!!!!!
class QuestionsWidget extends StatefulWidget {
  final List<dynamic> questions;
  final int moduleId;
  final int sectionId;
  final String sectionName;
  final String moduleName;

  const QuestionsWidget(
      {Key? key,
      required this.questions,
      required this.moduleId,
      required this.sectionId,
      required this.sectionName,
      required this.moduleName})
      : super(key: key);

  @override
  State<QuestionsWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  int count = 0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final studyProtocolHelper = StudyProtocolHelper();
  List resultData = [];

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String userId = "";
  String studyId = "";

  // DateFormat format = DateFormat('yyyy-MM-dd – kk:mm');

  @override
  void initState() {
    _prefs.then((SharedPreferences p) {
      userId = p.getString('userId') ?? "";
      studyId = p.getString('studyId') ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: FutureBuilder<kit.Task>(
            future: _getTask(widget.questions),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data != null) {
                final task = snapshot.data!;
                var i = 0;

                return kit.SurveyKit(
                  surveyController: kit.SurveyController(
                    onCloseSurvey: (context, resultFunction) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Are you sure!'),
                            content:
                                const Text("Do you want abort SURVEY module?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel')),
                              TextButton(
                                  onPressed: () {
                                    Routes.goHome(context);
                                  },
                                  child: const Text('Yes, abort'))
                            ],
                          );
                        },
                      );
                    },
                    onNextStep: (context, resultFunction) {
                      BlocProvider.of<SurveyPresenter>(context).add(
                        NextStep(
                          resultFunction.call(),
                        ),
                      );
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                  onResult: (kit.SurveyResult result) async {
                    for (var stepResult in result.results) {
                      for (var questionResult in stepResult.results) {
                        if (questionResult.valueIdentifier.toString() !=
                            "instruction") {
                          var questionMap = {
                            'questionId': i,
                            'value': questionResult.valueIdentifier.toString(),
                          };
                          resultData.add(questionMap);
                          i++;
                        }
                      }
                    }

                    String lowerSectionName =
                        widget.sectionName.trim().toLowerCase();
                    String formatedSectionName =
                        lowerSectionName.replaceAll(" ", "_");
                    String formatedSectionId =
                        "${formatedSectionName}_${widget.sectionId}";

                    if (resultData.isNotEmpty) {
                      final moduleData = {
                        "userId": userId,
                        "studyId": studyId,
                        "moduleId": widget.moduleId,
                        "sectionId": formatedSectionId,
                        "sectionName": widget.sectionName,
                        "moduleName": widget.moduleName,
                        "datetime": DateTime.now(),
                        "type": "survey",
                        "values": resultData,
                      };

                      if (userId.isNotEmpty && studyId.isNotEmpty) {
                        await users
                            .doc(userId)
                            .collection('studies')
                            .doc()
                            .set(moduleData);

                        await studyProtocolHelper
                            .markTaskAsComplemented(widget.sectionId);
                        Routes.goHome(context);
                      }
                    }
                  },
                  task: task,
                  showProgress: true,
                  localizations: const {
                    'cancel': 'Cancel',
                    'next': 'Next',
                  },
                  themeData: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch(
                      primarySwatch: Colors.cyan,
                    ).copyWith(
                      onPrimary: Colors.white,
                    ),
                    primaryColor: Colors.amber,
                    backgroundColor: Colors.white,
                    appBarTheme: const AppBarTheme(
                      color: Colors.white,
                      iconTheme: IconThemeData(
                        color: Colors.cyan,
                      ),
                      titleTextStyle: TextStyle(
                        color: Colors.cyan,
                      ),
                    ),
                    iconTheme: const IconThemeData(
                      color: Colors.cyan,
                    ),
                    textSelectionTheme: const TextSelectionThemeData(
                      cursorColor: Colors.cyan,
                      selectionColor: Colors.cyan,
                      selectionHandleColor: Colors.cyan,
                    ),
                    cupertinoOverrideTheme: const CupertinoThemeData(
                      primaryColor: Colors.cyan,
                    ),
                    outlinedButtonTheme: OutlinedButtonThemeData(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(150.0, 60.0),
                        ),
                        side: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return const BorderSide(
                                color: Colors.grey,
                              );
                            }
                            return const BorderSide(
                              color: Colors.cyan,
                            );
                          },
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        textStyle: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> state) {
                            if (state.contains(MaterialState.disabled)) {
                              return Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                    color: Colors.grey,
                                  );
                            }
                            return Theme.of(context).textTheme.button?.copyWith(
                                  color: Colors.cyan,
                                );
                          },
                        ),
                      ),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.cyan,
                              ),
                        ),
                      ),
                    ),
                    textTheme: const TextTheme(
                      headline2: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                      headline5: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      bodyText2: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                      subtitle1: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                    inputDecorationTheme: const InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  surveyProgressbarConfiguration:
                      kit.SurveyProgressConfiguration(
                    backgroundColor: Colors.white,
                  ),
                );
              }
              return const CircularProgressIndicator.adaptive();
            },
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: widget.questions.length,
      //   itemBuilder: (context, index) {
      //     final item = widget.questions[index];
      //     return _questionWidget(item, context);
      //   },
      // ),
    );
  }

  Future<kit.Task> _getTask(List<dynamic> items) {
    // print(items);
    List<kit.Step> steps = [];
    for (var item in items) {
      // print(item['type']);
      switch (item['type']) {
        case "instruction":
          steps.add(
            CustomInstructionStep(title: item['type'], text: item['text']),
          );
          break;
        case "text":
          if (item['subtype'] == 'numeric') {
            steps.add(
              CustomQuestionStep(
                title: item['text'],
                answerFormat: const kit.IntegerAnswerFormat(
                  hint: 'Enter',
                ),
                isOptional: false,
              ),
            );
          } else {
            steps.add(
              CustomQuestionStep(
                title: item['text'],
                text: item['hide_id'] != null
                    ? item['hide_id'] + "#" + item['hide_value']
                    : '',
                answerFormat: const kit.TextAnswerFormat(
                  hint: 'Enter',
                ),
                isOptional: true,
              ),
            );
          }

          break;
        case "multi":
          List<kit.TextChoice> options = [];
          for (var option in item['options']) {
            options.add(kit.TextChoice(text: option, value: option));
          }
          steps.add(
            CustomQuestionStep(
              title: item['text'],
              text: item['id'] ?? '',
              answerFormat: kit.SingleChoiceAnswerFormat(
                textChoices: options,
              ),
              isOptional: false,
            ),
          );
          break;
      }
    }

    // print(steps.first.title);
    // steps.add(
    //   kit.CompletionStep(
    //     stepIdentifier: kit.StepIdentifier(id: 'completeId'),
    //     text: 'Thanks for taking the survey!',
    //     title: 'Done!',
    //     // buttonText: 'Submit survey',
    //   ),
    // );
    var task = kit.NavigableTask(id: kit.TaskIdentifier(), steps: steps);
    // print(task.steps.first.);
    // print(task.initalStep?.stepIdentifier);
    // print(task.steps.);
    _buildNavigationRule(task);

    return Future.value(task);
    // Widget w = Container();
    // // print(item['type']);
    // switch (item['type']) {
    //   case "instruction":
    //     w = _instructionWidget(item, context);
    //     break;
    //   case "text":
    //     w = _textWidget(item, context);
    //     break;
    //   case "multi":
    //     w = _multiWidget(item, context);
    //     break;
    // }
    // return w;
  }

  kit.NavigableTask _buildNavigationRule(kit.NavigableTask task) {
    Map<String, dynamic> hideIds = {};

    for (var step in task.steps) {
      var obj = step.toJson();
      // print(obj['text']);

      if (obj['text'] != '' &&
          obj['answerFormat'].runtimeType == kit.TextAnswerFormat) {
        var arr = obj['text'].split('#');
        hideIds[arr[0]] = arr[1];
      }
    }

    int count = 0;
    for (var step in task.steps) {
      var obj = step.toJson();
      if (obj['text'] != '' &&
          obj['answerFormat'].runtimeType == kit.SingleChoiceAnswerFormat) {
        if (hideIds.containsKey(obj['text'])) {
          String value = hideIds[obj['text']];
          int curentIndex = count;

          task.addNavigationRule(
            forTriggerStepIdentifier: step.stepIdentifier,
            navigationRule: kit.ConditionalNavigationRule(
              resultToStepIdentifierMapper: (input) {
                if (input == value) {
                  int nextStep = curentIndex + 1;
                  return task.steps[nextStep].stepIdentifier;
                } else {
                  int plusTwoStep = curentIndex + 2;

                  return task.steps[plusTwoStep].stepIdentifier;
                }
              },
            ),
          );
        }
      }
      count++;
    }

    return task;
  }
}
