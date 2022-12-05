// import 'package:Veris/data/models/user.dart';
// import 'package:Veris/presentation/bloc/auth_bloc.dart';
// import 'package:Veris/presentation/pages/trial_BMP_page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:Veris/presentation/widgets/step10_widget.dart';
// import 'package:Veris/style/theme.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:video_player/video_player.dart';


// class IntroTabWidget extends StatefulWidget {
//   const IntroTabWidget({Key? key}) : super(key: key);

//   @override
//   State<IntroTabWidget> createState() => _IntroTabWidgetWidgetState();
// }

// class _IntroTabWidgetWidgetState extends State<IntroTabWidget> {
//   final introKey = GlobalKey<IntroductionScreenState>();
//   late VideoPlayerController controller1, controller2;
//   late User user;

//   @override
//   void initState() {
//     loadVideoPlayer();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller1.dispose();
//     controller2.dispose();
//     super.dispose();
//   }

//   Widget _buildImage(String assetName, [double width = 350]) {
//     return Image.asset('assets/images/$assetName', width: width);
//   }

//   loadVideoPlayer() {
//     controller1 = VideoPlayerController.asset(
//         "assets/videos/heart_beat_sound_out_sync.mp4");
//     controller1.addListener(() {
//       setState(() {});
//     });
//     controller1.initialize().then((value) {
//       setState(() {});
//     });

//     controller2 = VideoPlayerController.asset(
//         "assets/videos/video_for_MAD_task_final.mp4");
//     controller2.addListener(() {
//       setState(() {});
//     });
//     controller2.initialize().then((value) {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     const bodyStyle = TextStyle(fontSize: 19.0);
//     user = context.select((AuthBloc bloc) => bloc.state.user);

//     const pageDecoration = PageDecoration(
//       titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
//       bodyTextStyle: bodyStyle,
//       bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
//       pageColor: Colors.white,
//       imagePadding: EdgeInsets.zero,
//     );

//     return IntroductionScreen(
//       key: introKey,
//       globalBackgroundColor: Colors.white,
//       // globalHeader: Align(
//       //   alignment: Alignment.topRight,
//       //   child:  SafeArea(
//       //       child: Padding(
//       //         padding: const EdgeInsets.only(top: 16, right: 16),
//       //         child: Text(""),
//       //       ),
//       //     ),

//       // ),
//       onChange: (value) {
//         if (controller1.value.isPlaying) {
//           controller1.pause();
//         }

//         if (controller2.value.isPlaying) {
//           controller2.pause();
//         }
//       },
//       // globalFooter: SizedBox(
//       //   width: double.infinity,
//       //   height: 60,
//       //   child: ElevatedButton(
//       //     child: const Text(
//       //       'Let\'s go right away!',
//       //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//       //     ),
//       //     onPressed: () => (){},
//       //   ),
//       // ),
//       isProgress: false,
//       pages: [
//         PageViewModel(
//           title: '',
//           bodyWidget:
//           Column (children: const [
//             SizedBox(height: 200.0,),
//             Text ( textAlign: TextAlign.center ,"How well can you match a sound with your heartbeat?\n\nLet’s find out!", style: TextStyle(fontSize:18.0),)
//           ],),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "",
//                     bodyWidget:
//           Column (children: const [
//             SizedBox(height: 200.0,),
//             Text ( textAlign: TextAlign.center ,"Find a quiet place where you can sit comfortably upright for around 10 minutes. We'll be recording your heart beats, so you therefore need to keep your hand still and in the correct position. Also, make sure you turn your phone's volume up and don't use earphones (plugged or bluetooth)", style: TextStyle(fontSize:18.0),)
//           ],),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "Getting ready to check your heartbeat.",
//           bodyWidget: Column(
//             children: const [
//               Text(
//                   "We will shortly turn on the LED Flash and camera on this phone, and will use it to take your heart rate. Please place your index finger across both camera and flash."),
//             ],
//           ),
//           image: _buildImage('hand.png'),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "Baseline",
//           // body:
//           //     "Ok, thanks! In the main task, you will be asked to place your finger on the phone camera (on the back) so that the app can read your heartbeat.\n\nOnce your finger is in position, you will hear a series of sounds.\n\nEach sound actually represents one of your own heartbeats!",
//           // image: _buildImage('hand.png'),
//           bodyWidget: null,
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "Ok, thanks!",
//           body:
//               "In the main task, you will be asked to place your finger on the phone camera (on the back) so that the app can read your heartbeat.\n\nOnce your finger is in position, you will hear a series of sounds.\n\nEach sound actually represents one of your own heartbeats!",
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "STEP 6",
//           bodyWidget: Container(
//               child: Column(children: [
//             AspectRatio(
//               aspectRatio: controller1.value.aspectRatio,
//               child: VideoPlayer(controller1),
//             ),
//             Container(
//                 child: VideoProgressIndicator(controller1,
//                     allowScrubbing: true,
//                     colors: const VideoProgressColors(
//                       backgroundColor: Colors.redAccent,
//                       playedColor: Colors.green,
//                       bufferedColor: Colors.purple,
//                     ))),
//             Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         if (controller1.value.isPlaying) {
//                           controller1.pause();
//                         } else {
//                           controller1.play();
//                         }
//                         // setState(() {});
//                       },
//                       icon: Icon(
//                         controller1.value.isPlaying
//                             ? Icons.stop
//                             : Icons.play_arrow,
//                         size: 40,
//                       )),
//                   // IconButton(
//                   //     onPressed: () {
//                   //       controller.seekTo(const Duration(seconds: 0));
//                   //       setState(() {});
//                   //     },
//                   //     icon: const Icon(Icons.stop))
//                 ],
//               ),
//             ),
//             Container(
//                 child: const Center(
//                     child: Text(
//               "It might seem like there is a delay between the sounds and the heartbeats you feel.\n\nPlay the video below to hear an example!",
//               style: TextStyle(fontSize: 18.0),
//             )))
//           ])),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "",
//           body:
//               "Your objective is to find the point on the dial where the heartbeat and sound is in sync, by turning the dial left or right.",
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "",
//           body:
//               "Want to know how this might look like?\n\nPress “->” to watch a short tutorial.",
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "",
//           bodyWidget: Container(
//               width: 250,
//               child: Column(children: [
//                 AspectRatio(
//                   aspectRatio: controller2.value.aspectRatio,
//                   child: VideoPlayer(controller2),
//                 ),
//                 Container(
//                     child: VideoProgressIndicator(controller2,
//                         allowScrubbing: true,
//                         colors: const VideoProgressColors(
//                           backgroundColor: Colors.redAccent,
//                           playedColor: Colors.green,
//                           bufferedColor: Colors.purple,
//                         ))),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             if (controller2.value.isPlaying) {
//                               controller2.pause();
//                             } else {
//                               controller2.play();
//                             }
//                             setState(() {});
//                           },
//                           icon: Icon(
//                             controller2.value.isPlaying
//                                 ? Icons.pause
//                                 : Icons.play_arrow,
//                             size: 40,
//                           )),
//                       // IconButton(
//                       //     onPressed: () {
//                       //       controller2.seekTo(const Duration(seconds: 0));
//                       //       setState(() {});
//                       //     },
//                       //     icon: const Icon(Icons.stop))
//                     ],
//                   ),
//                 ),
//               ])),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "",
//           bodyWidget: Step10Widget(),
//           decoration: pageDecoration,
//           footer: ElevatedButton(
//             onPressed: () {
//               // introKey.currentState?.animateScroll(0);
//             },
//             style: ElevatedButton.styleFrom(
//               primary: theme.primaryColor,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//             ),
//             child: const Text(
//               'Confirm',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//         PageViewModel(
//           title: "",
//           bodyWidget: const Text(
//             "You can feel your heartbeat in different places in your body, such as your chest or your fingers.You will be asked to indicate where you felt your heartbeat on a body map (like the one below) once every 5 trials. You can choose any of the highlighted body parts or you can select \"nowhere\" if you haven't felt your heartbeat in any particular place.",
//             style: TextStyle(fontSize: 16.0),
//           ),
//           decoration: pageDecoration,
//           image: _buildImage('mannequin2.png'),
//           // reverse: true,
//         ),
//         PageViewModel(
//           title: "",
//           body:
//               "For the duration of this task, please do not actively try to feel your pulse with your hand; we are only interested in what you feel! You might feel your heartbeat in various bodily locations. Just make sure you pick one and stick to using that one during the task.\n\nWhen you are ready to start, please sit comfortably upright with your earphones on and press “continue”.",
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "",
//           body:
//               "You will now get a chance to do two practice trials.\n\nFocus on feeling your heartbeat and try to match the sounds to your own heartbeat.",
//           decoration: pageDecoration,
//         ),
//         // PageViewModel(
//         //   title: "PRACTICE TRIAL 1:",
//         //   image: _buildImage('knob_with_arrows.png'),
//         //   bodyWidget: const Text(
//         //       "Move the dial until the tone matches your heart-beat, to the best of your perception. Please press confirm when you are done.",
//         //       style: TextStyle(fontSize: 16.0)),
//         //   decoration: pageDecoration,
//         //   footer: ElevatedButton(
//         //     onPressed: () {
//         //       showDialog(
//         //           context: context,
//         //           builder: (BuildContext context) {
//         //             return Trial1Widget();
//         //           });
//         //     },
//         //     style: ElevatedButton.styleFrom(
//         //       primary: theme.primaryColor,
//         //       shape: RoundedRectangleBorder(
//         //         borderRadius: BorderRadius.circular(8.0),
//         //       ),
//         //     ),
//         //     child: const Text(
//         //       'Move',
//         //       style: TextStyle(color: Colors.white),
//         //     ),
//         //   ),
//         // ),
//         // PageViewModel(
//         //   title: "",
//         //   bodyWidget: Trial2Widget(),
//         //   decoration: pageDecoration,
//         //   footer: ElevatedButton(
//         //     onPressed: () {
//         //       // introKey.currentState?.animateScroll(0);
//         //     },
//         //     style: ElevatedButton.styleFrom(
//         //       primary: theme.primaryColor,
//         //       shape: RoundedRectangleBorder(
//         //         borderRadius: BorderRadius.circular(8.0),
//         //       ),
//         //     ),
//         //     child: const Text(
//         //       'Continue',
//         //       style: TextStyle(color: Colors.white),
//         //     ),
//         //   ),
//         // ),
//         // PageViewModel(
//         //   title: "TRIAL 1",
//         //   body:
//         //       "Move the dial until the tone matches your heart-beat, to the best of your perception. Please press confirm when you are done.",
//         //   decoration: pageDecoration,
//         //   image: _buildImage('mannequin2.png'),
//         //   footer: ElevatedButton(
//         //     onPressed: () {
//         //       // introKey.currentState?.animateScroll(0);
//         //     },
//         //     style: ElevatedButton.styleFrom(
//         //       primary: theme.primaryColor,
//         //       shape: RoundedRectangleBorder(
//         //         borderRadius: BorderRadius.circular(8.0),
//         //       ),
//         //     ),
//         //     child: const Text(
//         //       'Confirm',
//         //       style: TextStyle(color: Colors.white),
//         //     ),
//         //   ),
//         // ),
//         // PageViewModel(
//         //   title: "BODY MAP:",
//         //   bodyWidget: Trial4Widget(),
//         //   decoration: pageDecoration,
//         //   footer: ElevatedButton(
//         //     onPressed: () {
//         //       showDialog(
//         //           context: context,
//         //           builder: (BuildContext context) {
//         //             return SelectBodyWidget();
//         //           });
//         //     },
//         //     style: ElevatedButton.styleFrom(
//         //       primary: theme.primaryColor,
//         //       // shape: RoundedRectangleBorder(
//         //       //   borderRadius: BorderRadius.circular(8.0),
//         //       // ),
//         //     ),
//         //     child: const Text(
//         //       'Select',
//         //       style: TextStyle(color: Colors.white),
//         //     ),
//         //   ),
//         // ),
//         // PageViewModel(
//         //   title: "TRIAL 15",
//         //   body:
//         //       "Move the dial until the tone matches your heart-beat, to the best of your perception. Please press confirm when you are done.",
//         //   decoration: pageDecoration,
//         //   image: _buildImage('mannequin2.png'),
//         //   footer: ElevatedButton(
//         //     onPressed: () {

//         //     },
//         //     style: ElevatedButton.styleFrom(
//         //       primary: theme.primaryColor,
//         //       shape: RoundedRectangleBorder(
//         //         borderRadius: BorderRadius.circular(8.0),
//         //       ),
//         //     ),
//         //     child: const Text(
//         //       'Confirm',
//         //       style: TextStyle(color: Colors.white),
//         //     ),
//         //   ),
//         // ),
//       ],
//       onDone: () async {
//         final prefs = await SharedPreferences.getInstance();
//         String formattedDate =
//             DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
//         prefs.setInt('numRuns', 0);
//         prefs.setInt('completeTrials', 0);
//         prefs.setString('startSet', formattedDate);
//         final docRef =
//             FirebaseFirestore.instance.collection('users').doc(user.id);
//         docRef.get().then(
//           (DocumentSnapshot doc) {
//             final data = doc.data() as Map<String, dynamic>;
//             prefs.setInt('numSet', data['last_set_number'] ?? 0);
//           },
//           onError: (e) => print("Error getting document: $e"),
//         );

//         Navigator.of(context).push<void>(TrialBMPPage.route());
//       },
//       //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
//       showSkipButton: false,
//       skipOrBackFlex: 0,
//       nextFlex: 0,
//       showBackButton: true,
//       //rtl: true, // Display as right-to-left
//       back: const Icon(Icons.arrow_back),
//       skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
//       next: const Icon(Icons.arrow_forward),
//       done: const Text('Start', style: TextStyle(fontWeight: FontWeight.w600)),
//       // curve: Curves.fastLinearToSlowEaseIn,
//       // controlsMargin: const EdgeInsets.all(16),
//       // controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
//       // dotsDecorator: const DotsDecorator(
//       //   size: Size(5.0, 5.0),
//       //   color: Color(0xFFBDBDBD),
//       //   activeSize: Size(11.0, 5.0),
//       //   activeShape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
//       //   ),
//       // ),
//       // dotsContainerDecorator: const ShapeDecoration(
//       //   color: Color(0xFF000000),
//       //   shape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//       //   ),
//       // ),
//     );
//   }
// }
