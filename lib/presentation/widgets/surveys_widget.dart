import 'package:Veris/presentation/widgets/survey_module_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SurveysWidget extends StatefulWidget {
  const SurveysWidget({Key? key}) : super(key: key);

  @override
  State<SurveysWidget> createState() => _SurveysWidgetState();
}

class _SurveysWidgetState extends State<SurveysWidget> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  // late User user;

  // List<Question> questions = [];
  // List modules = [];
  // List sections = [];
  // Future<String> _loadQuestionsAsset() async {
  //   return await rootBundle.loadString('assets/surveys/veris_test.json');
  // }

  // Future<Question> loadQuestions() async {
  //   String jsonString = await _loadQuestionsAsset();
  //   Question question = Question(question_text: '', question_id: '', question_type: '');
  //   final jsonResponse = json.decode(jsonString);
  //   for (int i = 0; i < jsonResponse["modules"].length; i++) {
  //     final module = jsonResponse["modules"][i];
  //     modules.add(module);
  //     for (int j = 0; j < module['sections'].length; j++) {
  //       final section = module['sections'][j];
  //       sections.add(section);
  //       for (int g = 0; g < section['questions'].length; g++) {
  //         question = Question.fromJson(section['questions'][g]);
  //         questions.add(question);
  //       }
  //     }
  //   }
  //   print(questions.first.question_text + " " + questions.first.isRequired.toString());
  //   // final data = Question.fromJson(question);
  //   // print(modules);
  //   return question;
  // }

  // void ManageData(Map data) {
  //   for (int i = 0; i < data["modules"].length; i++) {
  //     List all_answers = [];
  //     // all_answers.addAll(data["results"][i]["incorrect_answers"]);
  //     all_answers.add(data["modules"][i]["sections"]);
  //     all_answers.shuffle();

  //     // Questions.add(Question(
  //     //     data["results"][i]["question"],
  //     //     all_answers,
  //     //     // .add(data["results"][i]["correct_answer"]),
  //     //     data["results"][i]["correct_answer"]));
  //   }

  //   for (int i = 0; i < data["modules"].length; i++) {}
  // }

  @override
  Widget build(BuildContext context) {
    // user = context.select((AuthBloc bloc) => bloc.state.user);
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: db.collection('surveys').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print(snapshot.data!.docs.length);
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) {
                DocumentSnapshot survey = snapshot.data!.docs[index];
                print(survey.data());
                return Container(
                  margin: const EdgeInsets.only(
                      left: 20, top: 20, bottom: 20, right: 20),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SurveyModuleWidget(
                            surveyId: survey.get('study_id'),
                          ),
                        ),
                      );
                    },
                    title: Row(
                      children: [
                        const Text(
                          'Survey name: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(survey.get("study_name")),
                      ],
                    ),
                  ),
                );
              }),
            );
          }
        });
  }
}
