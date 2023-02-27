import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:survey_kit/survey_kit.dart';


import 'custom_integer_view.dart';
import 'custom_single_choice_view.dart';
import 'custom_text_view.dart';


@JsonSerializable()
class CustomQuestionStep extends Step {
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String text;
  @JsonKey(ignore: true)
  final Widget content;
  final AnswerFormat answerFormat;

  CustomQuestionStep({
    bool isOptional = false,
    String buttonText = 'Next',
    StepIdentifier? stepIdentifier,
    bool showAppBar = true,
    this.title = '',
    this.text = '',
    this.content = const SizedBox.shrink(),
    required this.answerFormat,
  }) : super(
          stepIdentifier: stepIdentifier,
          isOptional: isOptional,
          buttonText: buttonText,
          showAppBar: showAppBar,
        );

  @override
  Widget createView({required QuestionResult? questionResult}) {
    final key = ObjectKey(this.stepIdentifier.id);

    switch (answerFormat.runtimeType) {
      case IntegerAnswerFormat:
        return CustomIntegerAnswerView(
          key: key,
          questionStep: this,
          result: questionResult as IntegerQuestionResult?,
        );
      case TextAnswerFormat:
        return CustomTextAnswerView(
          key: key,
          questionStep: this,
          result: questionResult as TextQuestionResult?,
        );
      case SingleChoiceAnswerFormat:
        return CustomSingleChoiceAnswerView(
          key: key,
          questionStep: this,
          result: questionResult as SingleChoiceQuestionResult?,
        );
      // case MultipleChoiceAnswerFormat:
      //   return MultipleChoiceAnswerView(
      //     key: key,
      //     questionStep: this,
      //     result: questionResult as MultipleChoiceQuestionResult?,
      //   );
      // case ScaleAnswerFormat:
      //   return ScaleAnswerView(
      //     key: key,
      //     questionStep: this,
      //     result: questionResult as ScaleQuestionResult?,
      //   );
      // case BooleanAnswerFormat:
      //   return BooleanAnswerView(
      //     key: key,
      //     questionStep: this,
      //     result: questionResult as BooleanQuestionResult?,
      //   );
      // case DateAnswerFormat:
      //   return DateAnswerView(
      //     key: key,
      //     questionStep: this,
      //     result: questionResult as DateQuestionResult?,
      //   );
      // case TimeAnswerFormat:
      //   return TimeAnswerView(
      //     key: key,
      //     questionStep: this,
      //     result: questionResult as TimeQuestionResult?,
      //   );
      default:
        throw AnswerFormatNotDefinedException();
    }
  }
  
  // @override
  // Map<String, dynamic> toJson() {
  //   // TODO: implement toJson
  //   throw UnimplementedError();
  // }

  factory CustomQuestionStep.fromJson(Map<String, dynamic> json) =>
      _$QuestionStepFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionStepToJson(this);


}


CustomQuestionStep _$QuestionStepFromJson(Map<String, dynamic> json) => CustomQuestionStep(
      isOptional: json['isOptional'] as bool? ?? false,
      buttonText: json['buttonText'] as String? ?? 'Next',
      stepIdentifier: json['stepIdentifier'] == null
          ? null
          : StepIdentifier.fromJson(
              json['stepIdentifier'] as Map<String, dynamic>),
      showAppBar: json['showAppBar'] as bool? ?? true,
      title: json['title'] as String? ?? '',
      text: json['text'] as String? ?? '',
      answerFormat:
          AnswerFormat.fromJson(json['answerFormat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionStepToJson(CustomQuestionStep instance) =>
    <String, dynamic>{
      'stepIdentifier': instance.stepIdentifier,
      'isOptional': instance.isOptional,
      'buttonText': instance.buttonText,
      'showAppBar': instance.showAppBar,
      'title': instance.title,
      'text': instance.text,
      'answerFormat': instance.answerFormat,
    };