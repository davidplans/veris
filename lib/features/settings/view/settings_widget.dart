import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
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
    await _prefs.then((SharedPreferences p) {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    // final user = context.select((AuthBloc bloc) => bloc.state.user);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          // tileColor: Color.fromARGB(255, 232, 231, 228),
          title: const Text('Study Name'),
          subtitle: Text(studyName),
        ),
        const Divider(
          color: Color.fromARGB(255, 188, 190, 196), //color of divider
          height: 5, //height spacing of divider
          thickness: 1, //thickness of divier line
          indent: 5, //spacing at the start of divider
          endIndent: 25, //spacing at the end of divider
        ),
                ListTile(
          // tileColor: Color.fromARGB(255, 232, 231, 228),
          title: const Text('Author'),
          subtitle: Text(createdBy),
        ),
        const Divider(
          color: Color.fromARGB(255, 188, 190, 196), //color of divider
          height: 5, //height spacing of divider
          thickness: 1, //thickness of divier line
          indent: 5, //spacing at the start of divider
          endIndent: 25, //spacing at the end of divider
        ),
        ListTile(
          // tileColor: Color.fromARGB(255, 232, 231, 228),
          title: const Text('About this study'),
          subtitle: Text(instructions),
        ),
        const Divider(
          color: Color.fromARGB(255, 188, 190, 196), //color of divider
          height: 5, //height spacing of divider
          thickness: 1, //thickness of divier line
          indent: 5, //spacing at the start of divider
          endIndent: 25, //spacing at the end of divider
        ),
        ListTile(
          // tileColor: Color.fromARGB(255, 232, 231, 228),
          title: const Text('Support'),
          subtitle: Text(supportEmail),
        ),
        const Divider(
          color: Color.fromARGB(255, 188, 190, 196), //color of divider
          height: 5, //height spacing of divider
          thickness: 1, //thickness of divier line
          indent: 5, //spacing at the start of divider
          endIndent: 25, //spacing at the end of divider
        ),
        ListTile(
          // tileColor: Color.fromARGB(255, 232, 231, 228),
          title: const Text('Website'),
          subtitle: Text(supportUrl),
        ),
        const Divider(
          color: Color.fromARGB(255, 188, 190, 196), //color of divider
          height: 5, //height spacing of divider
          thickness: 1, //thickness of divier line
          indent: 5, //spacing at the start of divider
          endIndent: 25, //spacing at the end of divider
        ),
        ListTile(
          // tileColor: Color.fromARGB(255, 232, 231, 228),
          title: const Text('Ethics Information'),
          subtitle: Text(ethics),
        ),
        const Divider(
          color: Color.fromARGB(255, 188, 190, 196), //color of divider
          height: 5, //height spacing of divider
          thickness: 1, //thickness of divier line
          indent: 5, //spacing at the start of divider
          endIndent: 25, //spacing at the end of divider
        ),
                ListTile(
          // tileColor: Color.fromARGB(255, 232, 231, 228),
          title: const Text('Pls file'),
          subtitle: Text(pls),
        ),
        const Divider(
          color: Color.fromARGB(255, 188, 190, 196), //color of divider
          height: 5, //height spacing of divider
          thickness: 1, //thickness of divier line
          indent: 5, //spacing at the start of divider
          endIndent: 25, //spacing at the end of divider
        ),
      ],
    );
  }
}
