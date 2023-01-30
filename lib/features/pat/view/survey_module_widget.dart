import 'package:Veris/features/surveys/view/questions_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SurveyModuleWidget extends StatefulWidget {
  final String surveyId;
  const SurveyModuleWidget({Key? key, required this.surveyId})
      : super(key: key);

  @override
  State<SurveyModuleWidget> createState() => _SurveyModuleWidgetState();
}

class _SurveyModuleWidgetState extends State<SurveyModuleWidget> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    // user = context.select((AuthBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: db
              .collection('surveys')
              .doc(widget.surveyId)
              .collection('modules')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  DocumentSnapshot module = snapshot.data!.docs[index];
                  List sections = module.get('sections');
                  return ExpansionTile(
                    title: Text(module.get('name')),
                    children: [
                      for (var item in sections)
                        // print(item['sections']);
                        Container(
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
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(item['name']),
                            onTap: () {
                              if (item['questions'] != null) {
                                List<dynamic> questions = item['questions'];
                                // print(item['questions']);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => QuestionsWidget(
                                //       questions: questions,
                                //     ),
                                //   ),
                                // );
                              } else {
                                const Center(child: Text('No Questions!'));
                              }
                            },
                          ),
                        )
                    ],
                  );

                  // for (var item in sections) {
                  //   sectionWidget.add(
                  //     Container(
                  //       margin: const EdgeInsets.only(
                  //           left: 20, top: 20, bottom: 20, right: 20),
                  //       width: double.infinity,
                  //       height: 100,
                  //       decoration: BoxDecoration(
                  //         color: const Color.fromARGB(255, 222, 223, 156),
                  //         borderRadius: const BorderRadius.only(
                  //             topLeft: Radius.circular(10),
                  //             topRight: Radius.circular(10),
                  //             bottomLeft: Radius.circular(10),
                  //             bottomRight: Radius.circular(10)),
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.grey.withOpacity(0.5),
                  //             spreadRadius: 5,
                  //             blurRadius: 7,
                  //             offset: const Offset(
                  //                 0, 3), // changes position of shadow
                  //           ),
                  //         ],
                  //       ),
                  //       child: ListTile(
                  //         onTap: () {},
                  //         title: Text(item['name']),
                  //       ),
                  //     ),
                  //   );
                  // }
                  // return Column(children: sectionWidget);
                }),
              );
            }
          }),
    );
  }
}
