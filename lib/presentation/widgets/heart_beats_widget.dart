import 'package:flutter/material.dart';
import 'package:flutter_schema_health/presentation/pages/web_page.dart';
import 'package:flutter_schema_health/presentation/widgets/select_body_widget.dart';
import 'package:flutter_schema_health/presentation/widgets/step10_widget.dart';
import 'package:flutter_schema_health/presentation/widgets/step4_widget.dart';
import 'package:flutter_schema_health/presentation/widgets/step6_widget.dart';
import 'package:flutter_schema_health/presentation/widgets/step9_widget.dart';
import 'package:flutter_schema_health/presentation/widgets/trial1_widget.dart';
import 'package:flutter_schema_health/presentation/widgets/trial2_widget.dart';
import 'package:flutter_schema_health/presentation/widgets/trial4_widget.dart';
import 'package:flutter_schema_health/style/theme.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroTabWidget extends StatefulWidget {
  const IntroTabWidget({Key? key}) : super(key: key);

  @override
  State<IntroTabWidget> createState() => _IntroTabWidgetWidgetState();
}

class _IntroTabWidgetWidgetState extends State<IntroTabWidget> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
            // child: _buildImage('hand.png', 100),
          ),
        ),
      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => (){},
      //   ),
      // ),
      isProgress: false,
      pages: [
 

        PageViewModel(
          title: "STEP 1",
          body:
              "How well can you match a sound with your heartbeat?\n\nLet’s find out!",
          // image: _buildImage('hand.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "STEP 2",
          body:
              "First, find a quiet place where you can comfortably sit upright with your earphones on for around 10 minutes. We will begin by capturing a couple of minutes of your heart rate, to get a sense for how your heart does its thing.",
          // image: _buildImage('hand.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Getting ready to check your heartbeat.",
          bodyWidget: Column(
            children: const [
              Text(
                  "We will shortly turn on the LED Flash and camera on this phone, and will use it to take your heart rate. Please place your index finger across both camera and flash."),
            ],
          ),
          image: _buildImage('hand.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Checking your heartbeat",
          // body:
          //     "Ok, thanks! In the main task, you will be asked to place your finger on the phone camera (on the back) so that the app can read your heartbeat.\n\nOnce your finger is in position, you will hear a series of sounds.\n\nEach sound actually represents one of your own heartbeats!",
          image: _buildImage('hand.png'),
          bodyWidget: Step4Widget(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "STEP 5",
          body:
              "Ok, thanks! In the main task, you will be asked to place your finger on the phone camera (on the back) so that the app can read your heartbeat.\n\nOnce your finger is in position, you will hear a series of sounds.\n\nEach sound actually represents one of your own heartbeats!",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "STEP 6",
          bodyWidget: Step6Widget(),
          decoration: pageDecoration,
          // image: _buildImage('icon.png'),
          // reverse: true,
        ),
        PageViewModel(
          title: "STEP 7",
          body:
              "Your objective is to find the point on the dial where the heartbeat and sound is in sync, by turning the dial left or right.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "STEP 8",
          body:
              "Want to know how this might look like?\n\nPress “->” to watch a short tutorial.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "STEP 9",
          bodyWidget: Step9Widget(),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "STEP 10",
          bodyWidget: Step10Widget(),
          decoration: pageDecoration,
          footer: ElevatedButton(
            onPressed: () {
              // introKey.currentState?.animateScroll(0);
            },
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Confirm',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        PageViewModel(
          title: "STEP 11",
          bodyWidget: const Text(
            "You can feel your heartbeat in different places in your body, such as your chest or your fingers.You will be asked to indicate where you felt your heartbeat on a body map (like the one below) once every 5 trials. You can choose any of the highlighted body parts or you can select \"nowhere\" if you haven't felt your heartbeat in any particular place.",
            style: TextStyle(fontSize: 16.0),
          ),
          decoration: pageDecoration,
          image: _buildImage('mannequin2.png'),
          // reverse: true,
        ),
        PageViewModel(
          title: "STEP 12",
          body:
              "For the duration of this task, please do not actively try to feel your pulse with your hand; we are only interested in what you feel! You might feel your heartbeat in various bodily locations. Just make sure you pick one and stick to using that one during the task.\n\nWhen you are ready to start, please sit comfortably upright with your earphones on and press “continue”.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "STEP 13",
          body:
              "You will now get a chance to do two practice trials.\n\nFocus on feeling your heartbeat and try to match the sounds to your own heartbeat.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "PRACTICE TRIAL 1:",
          image: _buildImage('knob_with_arrows.png'),
          bodyWidget: const Text(
              "Move the dial until the tone matches your heart-beat, to the best of your perception. Please press confirm when you are done.", style: TextStyle(fontSize: 16.0)),
          decoration: pageDecoration,
          footer: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Trial1Widget();
                  });
            },
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Move',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        
        PageViewModel(
          title: "",
          bodyWidget: Trial2Widget(),
          decoration: pageDecoration,
          footer: ElevatedButton(
            onPressed: () {
              // introKey.currentState?.animateScroll(0);
            },
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        PageViewModel(
          title: "TRIAL 1",
          body:
              "Move the dial until the tone matches your heart-beat, to the best of your perception. Please press confirm when you are done.",
          decoration: pageDecoration,
          image: _buildImage('mannequin2.png'),
          footer: ElevatedButton(
            onPressed: () {
              // introKey.currentState?.animateScroll(0);
            },
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Confirm',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        PageViewModel(
          title: "BODY MAP:",
          bodyWidget: Trial4Widget(),
          decoration: pageDecoration,
          footer: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SelectBodyWidget();
                  });
            },
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Select',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        PageViewModel(
          title: "TRIAL 15",
          body:
              "Move the dial until the tone matches your heart-beat, to the best of your perception. Please press confirm when you are done.",
          decoration: pageDecoration,
          image: _buildImage('mannequin2.png'),
          footer: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WebPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Confirm',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
      onDone: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WebPage()),
        );
      },
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      // curve: Curves.fastLinearToSlowEaseIn,
      // controlsMargin: const EdgeInsets.all(16),
      // controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      // dotsDecorator: const DotsDecorator(
      //   size: Size(5.0, 5.0),
      //   color: Color(0xFFBDBDBD),
      //   activeSize: Size(11.0, 5.0),
      //   activeShape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
      //   ),
      // ),
      // dotsContainerDecorator: const ShapeDecoration(
      //   color: Color(0xFF000000),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
      //   ),
      // ),
    );
  }
}
