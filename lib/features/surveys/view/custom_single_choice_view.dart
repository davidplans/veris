import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';

import 'custom_question_step.dart';

class CustomSingleChoiceAnswerView extends StatefulWidget {
  final CustomQuestionStep questionStep;
  final SingleChoiceQuestionResult? result;

  const CustomSingleChoiceAnswerView({
    Key? key,
    required this.questionStep,
    required this.result,
  }) : super(key: key);

  @override
  _CustomSingleChoiceAnswerViewState createState() => _CustomSingleChoiceAnswerViewState();
}

class _CustomSingleChoiceAnswerViewState extends State<CustomSingleChoiceAnswerView> {
  late final DateTime _startDate;
  late final SingleChoiceAnswerFormat _singleChoiceAnswerFormat;
  TextChoice? _selectedChoice;

  @override
  void initState() {
    super.initState();
    _singleChoiceAnswerFormat =
        widget.questionStep.answerFormat as SingleChoiceAnswerFormat;
    _selectedChoice =
        widget.result?.result ?? _singleChoiceAnswerFormat.defaultSelection;
    _startDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: widget.questionStep,
      resultFunction: () => SingleChoiceQuestionResult(
        id: widget.questionStep.stepIdentifier,
        startDate: _startDate,
        endDate: DateTime.now(),
        valueIdentifier: _selectedChoice?.value ?? '',
        result: _selectedChoice,
      ),
      isValid: widget.questionStep.isOptional || _selectedChoice != null,
      title: widget.questionStep.title.isNotEmpty
          ? Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Text(
                widget.questionStep.title,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
          )
          : widget.questionStep.content,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Text(''
                // widget.questionStep.text,
                // style: Theme.of(context).textTheme.bodyText2,
                // textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                Divider(
                  color: Colors.grey,
                ),
                ..._singleChoiceAnswerFormat.textChoices.map(
                  (TextChoice tc) {
                    return SelectionListTile(
                      text: tc.text,
                      onTap: () {
                        if (_selectedChoice == tc) {
                          _selectedChoice = null;
                        } else {
                          _selectedChoice = tc;
                        }
                        setState(() {});
                      },
                      isSelected: _selectedChoice == tc,
                    );
                  },
                ).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
