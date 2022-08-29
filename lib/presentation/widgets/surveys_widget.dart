import 'package:Veris/data/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class SurveysWidget extends StatefulWidget {
  const SurveysWidget({Key? key}) : super(key: key);

  @override
  State<SurveysWidget> createState() => _SurveysWidgetState();
}

class _SurveysWidgetState extends State<SurveysWidget> {
  List<Question> questions = [];
  List modules = [];
  List sections = [];
  Future<String> _loadQuestionsAsset() async {
    return await rootBundle.loadString('assets/surveys/veris_test.json');
  }

  Future<Question> loadQuestions() async {
    String jsonString = await _loadQuestionsAsset();
    Question question = Question(question_text: '', question_id: '', question_type: '');
    final jsonResponse = json.decode(jsonString);
    for (int i = 0; i < jsonResponse["modules"].length; i++) {
      final module = jsonResponse["modules"][i];
      modules.add(module);
      for (int j = 0; j < module['sections'].length; j++) {
        final section = module['sections'][j];
        sections.add(section);
        for (int g = 0; g < section['questions'].length; g++) {
          question = Question.fromJson(section['questions'][g]);
          questions.add(question);
        }
      }
    }
    print(questions.first.question_text + " " + questions.first.isRequired.toString());
    // final data = Question.fromJson(question);
    // print(modules);
    return question;
  }

  void ManageData(Map data) {
    for (int i = 0; i < data["modules"].length; i++) {
      List all_answers = [];
      // all_answers.addAll(data["results"][i]["incorrect_answers"]);
      all_answers.add(data["modules"][i]["sections"]);
      all_answers.shuffle();

      // Questions.add(Question(
      //     data["results"][i]["question"],
      //     all_answers,
      //     // .add(data["results"][i]["correct_answer"]),
      //     data["results"][i]["correct_answer"]));
    }

    for (int i = 0; i < data["modules"].length; i++) {}
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Question>(
      future: loadQuestions(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          return Container();
        } else if (snapshot.hasError) {
          const Text('No data');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
