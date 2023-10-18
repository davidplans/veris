import 'dart:convert';

import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/pat/view/start_pat_text_page.dart';
import 'package:Veris/features/surveys/view/questions_widget.dart';
import 'package:flutter/material.dart';

class SurveyItem extends StatelessWidget {
  final ModuleForHomePage module;
  const SurveyItem({Key? key, required this.module}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(module.name),
        backgroundColor: const Color.fromARGB(255, 100, 155, 200),
        collapsedBackgroundColor: Colors.blue,
        leading: const Icon(Icons.bar_chart, color: Colors.amber),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ListView.builder(
              itemCount: module.sections!.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int indexSection) {
                final sectionItem = module.sections![indexSection];
                final sectionName = sectionItem.name;
                return ListTile(
                  title: Text("Section $sectionName"),
                  textColor: Colors.white,
                  iconColor: Colors.white,
                  trailing: Wrap(
                    spacing: 12, // space between two icons
                    children: const <Widget>[
                      Icon(Icons.arrow_forward), // icon-1
                      // Icon(Icons.message), // icon-2
                    ],
                  ),
                  onTap: (() async {
                    List<dynamic> questions = List.from(
                        jsonDecode(sectionItem.questions!) as Iterable);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionsWidget(
                          questions: questions,
                          moduleId: module.uuid,
                          sectionId: sectionItem.id!,
                          sectionName: sectionName,
                          moduleName: module.name,
                        ),
                      ),
                    );
                  }),
                );
              },
            ),
          )
        ]);
  }
}
