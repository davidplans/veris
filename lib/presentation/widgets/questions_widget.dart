import 'package:Veris/presentation/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_kit/survey_kit.dart' as kit;
// import 'package:survey_kit/survey_kit.dart';

class QuestionsWidget extends StatefulWidget {
  final List<dynamic> questions;
  final int moduleId;
  final int sectonId;
  final String sectionName;

  const QuestionsWidget(
      {Key? key,
      required this.questions,
      required this.moduleId,
      required this.sectonId,
      required this.sectionName})
      : super(key: key);

  @override
  State<QuestionsWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  int count = 0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List resultData = [];

  CollectionReference studies =
      FirebaseFirestore.instance.collection('studies');
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
    // print(widget.questions.first);
    // print(widget.moduleId);
    // print(widget.sectonId);

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
                      Navigator.of(context).push(HomePage.route());
                    },
                  ),
                  onResult: (kit.SurveyResult result) {
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
                    String sectionId =
                        "${formatedSectionName}_${widget.sectonId}";

                    if (resultData.isNotEmpty) {
                      final moduleData = {
                        "userId": userId,
                        "moduleId": widget.moduleId,
                        "sectionId": sectionId,
                        "datetime": DateTime.now(),
                        "values": resultData,
                      };
                      if (userId.isNotEmpty && studyId.isNotEmpty) {
                        studies
                            .doc(studyId)
                            .collection('modules')
                            .doc(widget.moduleId.toString())
                            .collection('sections')
                            .doc(sectionId)
                            .set(moduleData)
                            .then((value) => Navigator.of(context)
                                .push<void>(HomePage.route()));
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
    List<kit.Step> steps = [];
    for (var item in items) {
      switch (item['type']) {
        case "instruction":
          steps.add(
            kit.InstructionStep(
              title: item['type'],
              text: item['text'],
              buttonText: 'Let\'s go!',
            ),
          );
          break;
        case "text":
          steps.add(
            kit.QuestionStep(
              title: item['text'],
              answerFormat: const kit.TextAnswerFormat(
                hint: 'Enter',
              ),
              isOptional: true,
            ),
          );
          break;
        case "multi":
          List<kit.TextChoice> options = [];
          for (var option in item['options']) {
            options.add(kit.TextChoice(text: option, value: option));
          }
          steps.add(
            kit.QuestionStep(
              title: item['text'],
              answerFormat: kit.SingleChoiceAnswerFormat(
                textChoices: options,
              ),
              isOptional: false,
            ),
          );
          break;
      }
    }
    steps.add(
      kit.CompletionStep(
        stepIdentifier: kit.StepIdentifier(id: 'completeId'),
        text: 'Thanks for taking the survey!',
        title: 'Done!',
        buttonText: 'Submit survey',
      ),
    );
    var task = kit.NavigableTask(id: kit.TaskIdentifier(), steps: steps);
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
}
