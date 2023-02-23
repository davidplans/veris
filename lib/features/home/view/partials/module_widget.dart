import 'dart:convert';

import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/pat/view/start_pat_text_page.dart';
import 'package:Veris/features/surveys/view/questions_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModuleWidget extends StatelessWidget {
  final ModuleForHomePage module;
  final int moduleId;
  final dynamic prefs;

  const ModuleWidget(
      {Key? key, required this.module, this.moduleId = 0, this.prefs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moduleName = module.name;
    return ExpansionTile(
      title: Text(moduleName),
      backgroundColor: const Color.fromARGB(255, 100, 155, 200),
      collapsedBackgroundColor: (() {
        switch (module.type) {
          case "survey":
            return Colors.blue;
          case "pat":
            return Colors.amber[300];
          case "smile":
            return Colors.purple[700];
        }
      }()),
      leading: (() {
        switch (module.type) {
          case "survey":
            return const Icon(Icons.bar_chart, color: Colors.amber);
          case "pat":
            return const Icon(Icons.favorite, color: Colors.red);
          case "smile":
            return const Icon(Icons.sentiment_satisfied, color: Colors.white);
        }
      }()),
      children: [
        module.type == 'survey'
            ? Padding(
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
                              moduleId: moduleId,
                              sectionId: sectionItem.id!,
                              sectionName: sectionName,
                              moduleName: moduleName,
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              )
            : module.type == 'pat'
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ListTile(
                      title: const Text("Start test"),
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
                        await prefs.then((SharedPreferences p) {
                          final studyId = p.getString('study_id');
                          final now = DateTime.now().microsecondsSinceEpoch;
                          final String moduleResultID =
                              '$studyId-$moduleId-$now';

                          p.setInt('maxTrials', module.options['total_trials']);
                          p.setInt('stepBodySelect',
                              module.options['step_body_select']);
                          p.setInt('numRuns', 0);
                          p.setInt('completeTrials', 0);
                          p.setString('currentModuleResultId', moduleResultID);
                          p.setInt('moduleId', moduleId);
                        }).whenComplete(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StartPatPage()),
                          );
                        });
                      }),
                    ),
                  )
                : module.type == 'smile'
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: ListTile(
                          title: const Text("Smile"),
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           const SmilePage()),
                            // );
                          }),
                        ),
                      )
                    : Container()
      ],
    );
  }
}
