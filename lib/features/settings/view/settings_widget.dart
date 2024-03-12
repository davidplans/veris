import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/features/authentication/bloc/auth_event.dart';
import 'package:Veris/features/settings/view/partials/listtile_with_divider.dart';
import 'package:Veris/routes/routes.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTileWithDivider(title: 'Study Name', value: studyName),
            ListTileWithDivider(title: 'Author', value: createdBy),
            ListTileWithDivider(title: 'About this study', value: instructions),
            ListTileWithDivider(title: 'Support', value: supportEmail),
            ListTileWithDivider(title: 'Website', value: supportUrl),
            ListTileWithDivider(title: 'Ethics Information', value: ethics),
            ListTileWithDivider(title: 'Pls file', value: pls),
            Center(
                child: Column(children: [
              // MainButtonComponent(
              //   title: 'Start with new Study protocol',
              //   backgroundColor: ColorConstants.btnPrimaryDefaultColor,
              //   titleColor: ColorConstants.textInvertedColor,
              //   onPressed: () async {
              //     await studyProtocolHelper
              //         .cleanInfoAboutCurrentStudyProtocol();
              //     // ignore: use_build_context_synchronously
              //     context.go(Routes.intro.path);
              //   },
              // ),
              const SizedBox(
                height: 20.0,
              ),
              MainButtonComponent(
                title: 'Input URL',
                backgroundColor: const Color.fromARGB(255, 6, 47, 80),
                titleColor: ColorConstants.textInvertedColor,
                onPressed: () {
                  context.go(Routes.intro.path);
                },
              ),
              SizedBox(height: 10.0),
              MainButtonComponent(
                title: 'Log OUT',
                backgroundColor: Colors.red,
                titleColor: ColorConstants.textInvertedColor,
                onPressed: () {
                  context.read<AuthBloc>().add(AuthenticationLogoutRequested());
                },
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
