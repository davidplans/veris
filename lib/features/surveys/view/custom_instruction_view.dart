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

  factory CustomInstructionStep.fromJson(Map<String, dynamic> json) =>
      _$InstructionStepFromJson(json);
  Map<String, dynamic> toJson() => _$InstructionStepToJson(this);

  bool operator ==(o) =>
      super == (o) &&
      o is CustomInstructionStep &&
      o.title == title &&
      o.text == text;
  int get hashCode => super.hashCode ^ title.hashCode ^ text.hashCode;
}

CustomInstructionStep _$InstructionStepFromJson(Map<String, dynamic> json) =>
    CustomInstructionStep(
      title: json['title'] as String,
      text: json['text'] as String,
      isOptional: json['isOptional'] as bool? ?? false,
      buttonText: json['buttonText'] as String? ?? 'Next',
      stepIdentifier: json['stepIdentifier'] == null
          ? null
          : StepIdentifier.fromJson(
              json['stepIdentifier'] as Map<String, dynamic>),
      canGoBack: json['canGoBack'] as bool?,
      showProgress: json['showProgress'] as bool?,
      showAppBar: json['showAppBar'] as bool? ?? true,
    );

Map<String, dynamic> _$InstructionStepToJson(CustomInstructionStep instance) =>
    <String, dynamic>{
      'stepIdentifier': instance.stepIdentifier,
      'isOptional': instance.isOptional,
      'buttonText': instance.buttonText,
      'canGoBack': instance.canGoBack,
      'showProgress': instance.showProgress,
      'showAppBar': instance.showAppBar,
      'title': instance.title,
      'text': instance.text,
    };

class CustomInstructionView extends StatelessWidget {
  final CustomInstructionStep customInstructionStep;
  final DateTime _startDate = DateTime.now();

  CustomInstructionView({super.key, required this.customInstructionStep});

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
        child: HtmlWidget(customInstructionStep.text),
      ),
    );
  }
}
