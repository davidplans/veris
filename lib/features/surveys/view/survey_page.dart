import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/features/authentication/view/partials/tab_bar_widget.dart';
import 'package:Veris/features/surveys/view/partials/survey_input_text.dart';
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
  int activeTabIndex = 0;
  // int tabLength = 3;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: widget.questions.length,
      initialIndex: activeTabIndex,
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
          padding: const EdgeInsets.symmetric(vertical: 15.0 ),
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
    print(items);
    List<Widget> steps = [];
    for (var item in items) {
      switch (item['type']) {
        case "instruction":
          steps.add(Text(item['text']));
          break;
        case "text":
          // if (item['subtype'] == 'numeric') {

          steps.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(item, index),
              SurveyInputText(),
            ],
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
          steps.add(Column(
            children: [
              _buildTitle(item, index),
              Container(
                color: Colors.amber,
                width: 100,
                height: 100,
              ),
            ],
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
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TabBarWidget(
                    controller: _controller,
                    tabLength: widget.questions.length,
                    activeTabIndex: activeTabIndex),
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
                          children:
                              _buildQuestions(widget.questions, activeTabIndex),
                        ),
                      ),
                    ),
                  ),
                ),
                MainButtonComponent(
                  title: 'Next',
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    final nextStepIndex = _controller.index + 1;
                    setState(() {
                      activeTabIndex = nextStepIndex;
                      _controller.animateTo(activeTabIndex);
                    });
                  },
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
