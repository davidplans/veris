import 'dart:convert';

import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/pat/view/start_pat_text_page.dart';
import 'package:Veris/features/surveys/view/questions_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModuleWidget extends StatelessWidget {
  final ModuleForHomePage module;

  const ModuleWidget({Key? key, required this.module}) : super(key: key);

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
                              moduleId: module.id,
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
                        ],
                      ),
                      onTap: (() async {
                        final prefs = await SharedPreferences.getInstance();

                        final studyId = prefs.getString('study_id');
                        final now = DateTime.now().microsecondsSinceEpoch;
                        final String moduleResultID =
                            '$studyId-${module.id}-$now';

                        prefs.setInt(
                            'maxTrials', module.options['total_trials']);
                        prefs.setInt('stepBodySelect',
                            module.options['step_body_select']);
                        prefs.setInt('numRuns', 0);
                        prefs.setInt('completeTrials', 0);
                        prefs.setString(
                            'currentModuleResultId', moduleResultID);
                        prefs.setInt('moduleId', module.id);

                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartPatPage()),
                        );
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
