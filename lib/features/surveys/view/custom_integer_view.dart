// import 'package:flutter/material.dart';
// import 'package:survey_kit/survey_kit.dart';

// import 'custom_question_step.dart';

// class CustomIntegerAnswerView extends StatefulWidget {
//   final CustomQuestionStep questionStep;
//   final IntegerQuestionResult? result;

//   const CustomIntegerAnswerView({
//     Key? key,
//     required this.questionStep,
//     required this.result,
//   }) : super(key: key);

//   @override
//   _CustomIntegerAnswerViewState createState() => _CustomIntegerAnswerViewState();
// }

// class _CustomIntegerAnswerViewState extends State<CustomIntegerAnswerView> {
//   late final IntegerAnswerFormat _integerAnswerFormat;
//   late final TextEditingController _controller;
//   late final DateTime _startDate;

//   bool _isValid = false;

//   @override
//   void initState() {
//     super.initState();
//     _integerAnswerFormat =
//         widget.questionStep.answerFormat as IntegerAnswerFormat;
//     _controller = TextEditingController();
//     _controller.text = widget.result?.result?.toString() ?? '';
//     _checkValidation(_controller.text);
//     _startDate = DateTime.now();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _checkValidation(String text) {
//     setState(() {
//       _isValid = text.isNotEmpty && int.tryParse(text) != null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StepView(
//       step: widget.questionStep,
//       resultFunction: () => IntegerQuestionResult(
//         id: widget.questionStep.stepIdentifier,
//         startDate: _startDate,
//         endDate: DateTime.now(),
//         valueIdentifier: _controller.text,
//         result: int.tryParse(_controller.text) ??
//             _integerAnswerFormat.defaultValue ??
//             null,
//       ),
//       isValid: _isValid || widget.questionStep.isOptional,
//       title: widget.questionStep.title.isNotEmpty
//           ? Padding(
//             padding: const EdgeInsets.only(left: 30, right: 30),
//             child: Text(
//                 widget.questionStep.title,
//                 style: Theme.of(context).textTheme.headline2,
//                 textAlign: TextAlign.center,
//               ),
//           )
//           : widget.questionStep.content,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 32.0),
//         child: Container(
//           width: MediaQuery.of(context).size.width/2,
//           child: TextField(
//             decoration: textFieldInputDecoration(
//               hint: _integerAnswerFormat.hint,
//             ),
//             controller: _controller,
//             onChanged: (String value) {
//               _checkValidation(value);
//             },
//             keyboardType: TextInputType.number,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }