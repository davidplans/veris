import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/common/widgets/custom_html_widget.dart';
import 'package:Veris/common/widgets/ui_components/alert_dialog.dart';
import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/core/user/user.dart';
import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/authentication/bloc/auth/auth_bloc.dart';
import 'package:Veris/features/authentication/view/partials/tab_bar_widget.dart';
import 'package:Veris/features/surveys/view/partials/survey_checkbox.dart';
import 'package:Veris/features/surveys/view/partials/survey_input_text.dart';
import 'package:Veris/features/surveys/view/partials/survey_radio_button.dart';
import 'package:Veris/routes/routes.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurveyPage extends StatefulWidget {
  final List<dynamic> questions;
  final String moduleId;
  final int sectionId;
  final String sectionName;
  final String moduleName;
  const SurveyPage(
      {super.key,
      required this.questions,
      required this.moduleId,
      required this.sectionId,
      required this.sectionName,
      required this.moduleName});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _controller;
  int _activeTabIndex = 0;
  bool _stepWasCompleted = false;
  List<dynamic> _answers = []; // Store the answers here

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final studyProtocolHelper = StudyProtocolHelper();

  late UserModel user;
  // int tabLength = 3;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: widget.questions.length,
      initialIndex: _activeTabIndex,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildTitle(dynamic item, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Question ${index + 1} / ${widget.questions.length}',
          style: const TextStyle(
            color: ColorConstants.textSecondaryColor,
            fontFamily: FontConstants.interFontFamily,
            fontSize: FontConstants.fontSize14,
            fontWeight: FontWeight.w400,
            height: 1.142,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            item['text'],
            style: const TextStyle(
              color: ColorConstants.textPrimaryColor,
              fontFamily: FontConstants.interFontFamily,
              fontSize: FontConstants.fontSize20,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildQuestions(List<dynamic> items, int index) {
    List<Widget> steps = [];
    for (var item in items) {
      switch (item['type']) {
        case "instruction":
          steps.add(
            SingleChildScrollView(
              child: CustomHtmlWidget(
                htmlText: item['text'],
                onChanged: (res) {
                  setState(() {
                    _stepWasCompleted = true;
                  });
                },
              ),
            ),
          );

          break;
        case "text":
          // if (item['subtype'] == 'numeric') {

          steps.add(SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(item, index),
                SurveyInputText(
                  onChanged: (text) {
                    _storeAnswerLocally(item, text);
                  },
                ),
              ],
            ),
          ));
          // }
          // else {
          //   steps.add(
          //     CustomQuestionStep(
          //       title: item['text'],
          //       text: item['hide_id'] != null
          //           ? item['hide_id'] + "#" + item['hide_value']
          //           : '',
          //       answerFormat: const kit.TextAnswerFormat(
          //         hint: 'Enter',
          //       ),
          //       isOptional: true,
          //     ),
          //   );
          // }

          break;
        case "multi":
          steps.add(
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(item, index),
                  SurveyRadioButton(
                    options: item['options'] as List,
                    onChanged: (value) {
                      _storeAnswerLocally(item, value);
                    },
                  )
                ],
              ),
            ),
          );
          break;
        case "checkbox":
          steps.add(
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(item, index),
                  SurveyCheckBox(
                    options: item['options'] as List,
                    onChanged: (value) {
                      _storeAnswerLocally(item, value);
                    },
                  )
                ],
              ),
            ),
          );
          break;
      }
    }
    return steps;
  }

  _storeAnswerLocally(dynamic item, dynamic answer) {
    if (item['required'] && answer.isEmpty) {
      _stepWasCompleted = false;
      return;
    }
    _answers.add({'questionId': item['id'], 'answer': answer});
    setState(() {
      _stepWasCompleted = true;
    });
  }

  _saveAnswers() async {
    String lowerSectionName = widget.sectionName.trim().toLowerCase();
    String formattedSectionName = lowerSectionName.replaceAll(" ", "_");
    String formattedSectionId = "${formattedSectionName}_${widget.sectionId}";

    var prefs = await _prefs;
    var userId = user.id;
    var studyId = prefs.getString('studyId');

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    final moduleData = {
      "userId": userId,
      "studyId": studyId,
      "moduleId": widget.moduleId,
      "sectionId": formattedSectionId,
      "sectionName": widget.sectionName,
      "moduleName": widget.moduleName,
      "datetime": DateTime.now(),
      "type": "survey",
      "values": _answers,
    };
    OverlayLoadingProgress.start(context);
    await users.doc(userId).collection('studies').doc().set(moduleData);
    await studyProtocolHelper.markTaskAsComplemented(widget.sectionId);
    OverlayLoadingProgress.stop();
  }

  @override
  Widget build(BuildContext context) {
    user = context.select((AuthBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBarWidget(title: widget.moduleName),
      body: DefaultTabController(
        length: widget.questions.length,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TabBarWidget(
                    controller: _controller,
                    tabLength: widget.questions.length,
                    activeTabIndex: _activeTabIndex),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TabBarView(
                          controller: _controller,
                          physics: const NeverScrollableScrollPhysics(),
                          children: _buildQuestions(
                              widget.questions, _activeTabIndex),
                        ),
                      ),
                    ),
                  ),
                ),
                MainButtonComponent(
                  title: 'Next',
                  onPressed: _stepWasCompleted
                      ? () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          final nextStepIndex = _controller.index + 1;
                          if (widget.questions.length == nextStepIndex) {
                            print(_answers);
                            await _saveAnswers();
                            // ignore: use_build_context_synchronously
                            context.go(Routes.home.path);
                            return;
                          }
                          setState(() {
                            _stepWasCompleted = false;
                            _activeTabIndex = nextStepIndex;
                            _controller.animateTo(_activeTabIndex);
                          });
                        }
                      : null,
                  backgroundColor: ColorConstants.btnPrimaryDefaultColor,
                  titleColor: ColorConstants.textInvertedColor,
                  sufixIconPath: 'assets/icons/arrow-forward.svg',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
