import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/pat/view/start_pat_text_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatItem extends StatelessWidget {
  final ModuleForHomePage module;
  const PatItem({Key? key, required this.module}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(module.name),
        backgroundColor: const Color.fromARGB(255, 100, 155, 200),
        collapsedBackgroundColor: Colors.amber[300],
        leading: const Icon(Icons.favorite, color: Colors.red),
        children: [
          Padding(
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
                final String moduleResultID = '$studyId-${module.id}-$now';

                prefs.setInt('maxTrials', module.options['total_trials']);
                prefs.setInt(
                    'stepBodySelect', module.options['step_body_select']);
                prefs.setInt('numRuns', 0);
                prefs.setInt('completeTrials', 0);
                prefs.setString('currentModuleResultId', moduleResultID);
                prefs.setInt('moduleId', module.id);

                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartPatPage()),
                );
              }),
            ),
          )
        ]);
  }
}
