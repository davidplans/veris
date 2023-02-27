import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/intro/view/intro_page.dart';
import 'package:Veris/features/settings/view/partials/listtile_with_divider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final studyProtocolHelper = StudyProtocolHelper();

  String studyName = "";
  String studyId = "";
  String createdBy = "";
  String instructions = "";
  String emptyMsg = "";
  String supportUrl = "";
  String supportEmail = "";
  String ethics = "";
  String pls = "";

  @override
  initState() {
    getProperties();
    super.initState();
  }

  Future<void> getProperties() async {
    final SharedPreferences p = await _prefs;
    setState(() {
      studyName = p.getString('study_name') ?? '';
      studyId = p.getString('study_id') ?? '';
      createdBy = p.getString('created_by') ?? '';
      instructions = p.getString('instructions') ?? '';
      emptyMsg = p.getString('empty_msg') ?? '';
      supportUrl = p.getString('support_url') ?? '';
      supportEmail = p.getString('support_email') ?? '';
      ethics = p.getString('ethics') ?? '';
      pls = p.getString('pls') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTileWithDivider(title: 'Study Name', value: studyName),
        ListTileWithDivider(title: 'Author', value: createdBy),
        ListTileWithDivider(title: 'About this study', value: instructions),
        ListTileWithDivider(title: 'Support', value: supportEmail),
        ListTileWithDivider(title: 'Website', value: supportUrl),
        ListTileWithDivider(title: 'Ethics Information', value: ethics),
        ListTileWithDivider(title: 'Pls file', value: pls),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          // color: const Color.fromARGB(255, 49, 56, 71),
          child: Center(
              child: Column(children: [
            ElevatedButton(
              onPressed: () async {
                await studyProtocolHelper.cleanInfoAboutCurrentStudyProtocol();
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const IntroPage()),
                );
              },
              child: const Text("Start with new Study protocol"),
            ),
          ])),
        )
      ],
    );
  }
}
