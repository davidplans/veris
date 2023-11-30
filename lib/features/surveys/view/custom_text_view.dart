// import 'package:flutter/material.dart';
// import 'package:survey_kit/survey_kit.dart';

// import 'custom_question_step.dart';

// class CustomTextAnswerView extends StatefulWidget {
//   final CustomQuestionStep questionStep;
//   final TextQuestionResult? result;

//   const CustomTextAnswerView({
//     Key? key,
//     required this.questionStep,
//     required this.result,
//   }) : super(key: key);

//   @override
//   _CustomTextAnswerViewState createState() => _CustomTextAnswerViewState();
// }

// class _CustomTextAnswerViewState extends State<CustomTextAnswerView> {
//   late final TextAnswerFormat _textAnswerFormat;
//   late final DateTime _startDate;

//   late final TextEditingController _controller;
//   bool _isValid = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController();
//     _controller.text = widget.result?.result ?? '';
//     _textAnswerFormat = widget.questionStep.answerFormat as TextAnswerFormat;
//     _checkValidation(_controller.text);
//     _startDate = DateTime.now();
//   }

//   void _checkValidation(String text) {
//     setState(() {
//       if (_textAnswerFormat.validationRegEx != null) {
//         RegExp regExp = new RegExp(_textAnswerFormat.validationRegEx!);
//         _isValid = regExp.hasMatch(text);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StepView(
//       step: widget.questionStep,
//       resultFunction: () => TextQuestionResult(
//         id: widget.questionStep.stepIdentifier,
//         startDate: _startDate,
//         endDate: DateTime.now(),
//         valueIdentifier: _controller.text,
//         result: _controller.text,
//       ),
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
//       isValid: _isValid || widget.questionStep.isOptional,
//       child: Column(
//         children: [
//          const Padding(
//             padding:
//                  EdgeInsets.only(bottom: 32.0, left: 14.0, right: 14.0),
//             child: Text(''
//               // widget.questionStep.text,
//               // style: Theme.of(context).textTheme.bodyText2,
//               // textAlign: TextAlign.center,
//             ),
//           ),
//           Container(
//             width: 200.0,
//             height: 50.0,
//             child: TextField(
//               decoration: textFieldInputDecoration(
//                 hint: _textAnswerFormat.hint,
//               ),
//               controller: _controller,
//               textAlign: TextAlign.center,
//               onChanged: (String text) {
//                 _checkValidation(text);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
