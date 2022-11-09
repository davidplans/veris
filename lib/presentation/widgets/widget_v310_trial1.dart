// import 'package:flutter/material.dart';

// class V310Trial1Widget extends StatefulWidget {
//   const V310Trial1Widget({super.key});

//   @override
//   State<V310Trial1Widget> createState() => _V310Trial1WidgetState();
// }

// class _V310Trial1WidgetState extends State<V310Trial1Widget> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//           AppBar(title: const Text('Veris'), automaticallyImplyLeading: false),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               flex: 1,
//               child: FloatingActionButton.extended(
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                 ),
//                 backgroundColor: const Color(0XFF0F2042),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 label: const Text(
//                   "Back",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//             const Expanded(flex: 1, child: SizedBox()),
//             Expanded(
//               flex: 1,
//               child: FloatingActionButton.extended(
//                 icon: const Icon(
//                   Icons.arrow_forward,
//                   color: Colors.white,
//                 ),
//                 backgroundColor: const Color(0XFF0F2042),
//                 onPressed: () {
//                   //                     Navigator.of(context).push(
//                   //   MaterialPageRoute(
//                   //     builder: (context) => const V22Widget(),
//                   //   ),
//                   // );
//                 },
//                 label: const Text(
//                   "Continue",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       body: Center(
//         child: Container(
//           color: Colors.white,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(((finalAngle * 180 / pi) + _currentValue).toStringAsFixed(0),
//                   style: const TextStyle(
//                     fontSize: 50,
//                   )),
//               const SizedBox(height: 100),
//               Container(
//                 width: 250,
//                 height: 250,
//                 color: Colors.white,
//                 child: LayoutBuilder(builder: (context, constraints) {
//                   return GestureDetector(
//                     behavior: HitTestBehavior.translucent,
//                     onPanUpdate: (details) {
//                       Offset centerOfGestureDetector = Offset(
//                           constraints.maxWidth / 2, constraints.maxHeight / 2);
//                       final touchPositionFromCenter =
//                           details.localPosition - centerOfGestureDetector;

//                       setState(
//                         () {
//                           if (((touchPositionFromCenter.direction * 180 / pi) +
//                                   _currentValue) >=
//                               60) {
//                             _timer.cancel();
//                             finalAngle = touchPositionFromCenter.direction;
//                             // _changeKnob(double.parse(
//                             //     ((touchPositionFromCenter.direction * 180 / pi) + _currentValue)
//                             //         .toStringAsFixed(0)));
//                           } else if (((touchPositionFromCenter.direction *
//                                           180 /
//                                           pi) +
//                                       _currentValue) <=
//                                   59 &&
//                               ((touchPositionFromCenter.direction * 180 / pi) +
//                                       _currentValue) >=
//                                   0) {
//                             _timer.cancel();
//                             finalAngle = touchPositionFromCenter.direction;
//                             // _changeKnob(double.parse(
//                             //     ((touchPositionFromCenter.direction * 180 / pi) + _currentValue)
//                             //         .toStringAsFixed(0)));
//                           }
//                         },
//                       );
//                     },
//                     onPanEnd: (details) {
//                       if (((finalAngle * 180 / pi) + _currentValue) >= 60) {
//                         _timer.cancel();
//                         _changeKnob(double.parse(
//                             ((finalAngle * 180 / pi) + _currentValue)
//                                 .toStringAsFixed(0)));
//                       } else if (((finalAngle * 180 / pi) + _currentValue) <=
//                               59 &&
//                           ((finalAngle * 180 / pi) + _currentValue) >= 0) {
//                         _timer.cancel();
//                         _changeKnob(double.parse(
//                             ((finalAngle * 180 / pi) + _currentValue)
//                                 .toStringAsFixed(0)));
//                       }
//                     },
//                     child: Transform.rotate(
//                       angle: finalAngle,
//                       child: const Image(
//                         image: AssetImage("assets/images/knob.png"),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//               const SizedBox(height: 50),
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 style: ElevatedButton.styleFrom(
//                   primary: theme.primaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//                 child: const Text(
//                   'Confirm',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               //             ElevatedButton(
//               //   onPressed: () => Navigator.pop(context),
//               //   style: ElevatedButton.styleFrom(
//               //     primary: theme.primaryColor,
//               //     shape: RoundedRectangleBorder(
//               //       borderRadius: BorderRadius.circular(8.0),
//               //     ),
//               //   ),
//               //   child: const Text(
//               //     'Cancel',
//               //     style: TextStyle(color: Colors.white),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
