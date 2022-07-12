import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_schema_health/presentation/widgets/beats_slider_widget.dart';
import 'dart:math';

import 'package:flutter_schema_health/style/theme.dart';
import 'package:just_audio/just_audio.dart';

class Trial1Widget extends StatefulWidget {
  const Trial1Widget({Key? key}) : super(key: key);

  @override
  State<Trial1Widget> createState() => _Trial1WidgetState();
}

class _Trial1WidgetState extends State<Trial1Widget> {
  double finalAngle = 0.0;
  final player = AudioPlayer();
  double _currentValue = 60;
  final double _durationToOneSec = 1.1605;
  bool isEndTouch = false;
  Timer _timer = Timer.periodic(const Duration(seconds: 60), (t) {});

  @override
  void initState() {
    super.initState();
    _getAssets();
  }

  _getAssets() async {
    await player
        .setAudioSource(
            AudioSource.uri(Uri.parse('asset:///assets/sounds/beep2.mp3')))
        .then((value) {
      _playBeep(_currentValue);
    });
  }

  _playBeep(double speed) {
    print("BEEP");
    // String s = player.duration.toString();
    // print("ВРЕМЯ1 " + s);
    if (speed >= 60) {
      player.setLoopMode(LoopMode.all);
      player.setSpeed(
          // beep.mp3 duration 0.862 / 1.1602 = 1.000 sec
          double.parse(((speed / 60) / _durationToOneSec).toStringAsFixed(3)));

      player.play();
    } else if (speed <= 59) {
      _timer.cancel();
      player.pause();
      // player.setLoopMode(LoopMode.off);
      player.setSpeed(1.0);
      
      _timer = Timer.periodic(const Duration(milliseconds: 5000), (t) {
        // TODO One beep in miliseconds
        
        player.play();
        
        print("END");
        // t.cancel();

      });

    }
  }

  _changeKnob(double value) {
    player.pause().then((v) {
      setState(() {
        // _currentValue = value;
        _playBeep(value);
      });
    });
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(((finalAngle * 180 / pi) + _currentValue).toStringAsFixed(0),
                  style: const TextStyle(
                    fontSize: 50,
                  )),
              const SizedBox(height: 100),
              Container(
                width: 250,
                height: 250,
                color: Colors.white,
                child: LayoutBuilder(builder: (context, constraints) {
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onPanUpdate: (details) {
                      Offset centerOfGestureDetector = Offset(
                          constraints.maxWidth / 2, constraints.maxHeight / 2);
                      final touchPositionFromCenter =
                          details.localPosition - centerOfGestureDetector;

                      setState(
                        () {
                          if (((touchPositionFromCenter.direction * 180 / pi) +
                                  _currentValue) >=
                              60) {
                            finalAngle = touchPositionFromCenter.direction;
                            // _changeKnob(double.parse(
                            //     ((touchPositionFromCenter.direction * 180 / pi) + _currentValue)
                            //         .toStringAsFixed(0)));
                          } else if (((touchPositionFromCenter.direction *
                                          180 /
                                          pi) +
                                      _currentValue) <=
                                  59 &&
                              ((touchPositionFromCenter.direction * 180 / pi) +
                                      _currentValue) >=
                                  0) {
                            finalAngle = touchPositionFromCenter.direction;
                            // _changeKnob(double.parse(
                            //     ((touchPositionFromCenter.direction * 180 / pi) + _currentValue)
                            //         .toStringAsFixed(0)));
                          }
                        },
                      );
                    },
                    onPanEnd: (details) {
                      if (((finalAngle * 180 / pi) + _currentValue) >= 60) {
                        _changeKnob(double.parse(
                            ((finalAngle * 180 / pi) + _currentValue)
                                .toStringAsFixed(0)));
                      } else if (((finalAngle * 180 / pi) + _currentValue) <=
                              59 &&
                          ((finalAngle * 180 / pi) + _currentValue) >= 0) {
                        _changeKnob(double.parse(
                            ((finalAngle * 180 / pi) + _currentValue)
                                .toStringAsFixed(0)));
                      }
                    },
                    child: Transform.rotate(
                      angle: finalAngle,
                      child: const Image(
                        image: AssetImage("assets/images/knob.png"),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
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
              //             ElevatedButton(
              //   onPressed: () => Navigator.pop(context),
              //   style: ElevatedButton.styleFrom(
              //     primary: theme.primaryColor,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //   ),
              //   child: const Text(
              //     'Cancel',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
