import 'package:flutter/material.dart';
import 'package:flutter_schema_health/presentation/pages/home_page.dart';
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
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Lets`s find out!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30.0),
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
              Image(
                image: AssetImage("assets/hand.png"),
                height: 200,
              ),
              Text(
                "Getting ready to check your heartbeat",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "We will shortly turn on the LED Flash and camera on this phone, and will use it to take your heart rate. Please place your index finger across both camera and flash.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0, color: Colors.white),
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
