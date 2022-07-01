import 'package:flutter/material.dart';
import 'package:flutter_schema_health/presentation/pages/home_page.dart';
import 'package:flutter_schema_health/presentation/widgets/beats_slider_widget.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroTabWidget extends StatefulWidget {
  const IntroTabWidget({Key? key}) : super(key: key);

  @override
  State<IntroTabWidget> createState() => _IntroTabWidgetWidgetState();
}

class _IntroTabWidgetWidgetState extends State<IntroTabWidget> {
  List<Slide> slides = [];


  @override
  void initState() {
    super.initState();

    slides.add(Slide(
      title: "STEP 1",
      widgetDescription: Center(
        child: Column(
          children: const [
            Text(
              "How well can you match a sound with your heartbeat.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Lets`s find out!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xff203152),
    ));
    slides.add(
      Slide(
        title: "STEP 2",
        widgetDescription: Center(
          child: Column(
            children: const [
              Text(
                "Find a quiet place where you can sit comfortably upright for around 10t minutes. We`ll be recording your heart beats, so you there fore need to keep your hand still and in the correct position. Also, make sure you turn your phone`s volume up and don`t use earphones (plugged or bluetooth).",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xff203152),
      ),
    );
    slides.add(
      Slide(
        title: "STEP 3",
        widgetDescription: Center(
          child: Column(
            children: const [
              Text(
                "Ok, thanks! In the main task, you will be asked to place your finger on the phone camera (on the back) so that the app can read your heartbeat.\n\nOnce your finger is in position, you will hear a series of sounds.\n\nEach sound actually represents one of your own heartbeats!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xff203152),
      ),
    );
    slides.add(
      Slide(
        title: "STEP 4",
        widgetDescription: Center(
          child: Column(
            children: const [
              Text(
                "Your objective is to find the point on the dial where the heartbeat and sound is in sync, by turning the dial left or right.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xff203152),
      ),
    );
    slides.add(
      Slide(
        title: "STEP 5",
        widgetDescription: Center(
          child: Column(
            children: const [
              Text(
                "Want to know how this might look like?\n\nPress “next” to watch a short tutorial.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xff203152),
      ),
    );
    slides.add(
      Slide(
        title: "STEP 6",
        widgetDescription: Center(
          child: Column(
            children: const [
              BeatsSlider(),
              Text(
                "After you have matched the sound with your heartbeat, you will be asked how sure you are about the answer you gave.\n\nPress “confirm” then “continue” to start the following trial. In this task, there will be 20 trials in total.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xff203152),
      ),
    );
  }

  Future<void> _readyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you ready'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you ready cheking your heartbeat?'),
                Text('It will take 2 minutes.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push<void>(HomePage.route());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      showSkipBtn: false,
      colorDot: Colors.white,
      onDonePress: _readyDialog,
    );
  }
}
