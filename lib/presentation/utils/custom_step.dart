import 'package:Veris/style/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:survey_kit/src/result/question_result.dart';
// import 'package:survey_kit/src/steps/step.dart';
// import 'package:survey_kit/src/steps/identifier/step_identifier.dart';
// import 'package:survey_kit/src/views/instruction_view.dart';
import 'package:survey_kit/survey_kit.dart';


class CustomInstructionStep extends Step {
  final String title;
  final String text;

  CustomInstructionStep({
required this.title,
    required this.text,
    bool isOptional = false,
    String buttonText = "Let's go",
    StepIdentifier? stepIdentifier,
    bool? canGoBack,
    bool? showProgress,
    bool showAppBar = true,
  }) : super(
          stepIdentifier: stepIdentifier,
          isOptional: isOptional,
          buttonText: buttonText,
          canGoBack: canGoBack ?? false,
          showProgress: showProgress ?? false,
          showAppBar: showAppBar,
        );

  @override
  Widget createView({required QuestionResult? questionResult}) {
    return CustomInstructionView(
      customInstructionStep: this,
    );
  }

  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class CustomInstructionView extends StatelessWidget {
  final CustomInstructionStep customInstructionStep;
  final DateTime _startDate = DateTime.now();

  CustomInstructionView({required this.customInstructionStep});

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: customInstructionStep,
      title: Text(
        customInstructionStep.title,
        style: const TextStyle(fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
      resultFunction: () => InstructionStepResult(
        customInstructionStep.stepIdentifier,
        _startDate,
        DateTime.now(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: HtmlWidget(
           customInstructionStep.text
        ),
      ),
    );
  }
}
