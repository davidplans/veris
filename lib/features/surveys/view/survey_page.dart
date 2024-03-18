import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/features/authentication/view/partials/tab_bar_widget.dart';
import 'package:Veris/features/surveys/view/partials/survey_input_text.dart';
import 'package:Veris/features/surveys/view/partials/survey_radio_button.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';

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
  bool _isSurveyComplete = false;
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
          steps.add(SingleChildScrollView(child: Text(item['text'])));
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
                    if (text != '' && text.isNotEmpty) {
                      setState(() {
                        _isSurveyComplete = true;
                      });
                    } else {
                      setState(() {
                        _isSurveyComplete = false;
                      });
                    }
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
          steps.add(SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(item, index),
                SurveyRadioButton(
                  options: item['options'] as List,
                  onChanged: (isChecked) {
                    if (isChecked) {
                      setState(() {
                        _isSurveyComplete = true;
                      });
                    } else {
                      setState(() {
                        _isSurveyComplete = false;
                      });
                    }
                  },
                )
              ],
            ),
          ));
          break;
      }
    }
    return steps;
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: _isSurveyComplete
                      ? () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          final nextStepIndex = _controller.index + 1;
                          setState(() {
                            _isSurveyComplete = false;
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
