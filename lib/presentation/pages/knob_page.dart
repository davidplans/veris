import 'dart:async';
import 'dart:math';

import 'package:Veris/presentation/pages/home_page.dart';
import 'package:Veris/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class KnobPage extends StatefulWidget {
  const KnobPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const KnobPage());
  }

  @override
  State<KnobPage> createState() => _KnobPageState();
}

class _KnobPageState extends State<KnobPage> {
  double finalAngle = 0.0;
  final player = AudioPlayer();
  // final player2 = AudioPlayer();
  final double _currentValue = 60;
  final double _durationToOneSec = 1.1605;
  final AudioSource source =
      AudioSource.uri(Uri.parse('asset:///assets/sounds/beep2.mp3'));
  Timer _timer = Timer.periodic(const Duration(seconds: 60), (t) {});
  bool _isStarting = false;

  @override
  void initState() {
    super.initState();
    // _playBeep(_currentValue);
  }

  // _getAssets() {
  //   player.setAudioSource(source).then((value) {
  //     _playBeep(_currentValue);
  //   });
  // }

  _playBeep(double speed) {
    player.setAudioSource(source).then((value) {
      if (speed >= 60) {
        player.setLoopMode(LoopMode.all);
        player.setSpeed(
            // beep.mp3 duration 0.862 / 1.1602 = 1.000 sec
            double.parse(
                ((speed / 60) / _durationToOneSec).toStringAsFixed(3)));

        player.play();
      } else if (speed <= 59) {
        player.setLoopMode(LoopMode.off);
        // _timer.cancel();
        print("TIMLES " + speed.toString());
        print("TIMLES " + (1000 / (60 / (speed))).round().toString());

        _timer = Timer.periodic(
            Duration(milliseconds: ((60 / (speed)) * 1000).round()), (t) {
          player.stop();
          player.setAudioSource(source);
          player.play();

          print("END");
          // t.cancel();
        });
      }
    });
  }

  _changeKnob(double value) {
    player.pause().then((v) {
      setState(() {
        _playBeep(value);
      });
    });
  }

  @override
  void deactivate() {
    player.stop();
    player.dispose();

    _timer.cancel();
    super.deactivate();
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
                            _timer.cancel();
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
                            _timer.cancel();
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
                        _timer.cancel();
                        _changeKnob(double.parse(
                            ((finalAngle * 180 / pi) + _currentValue)
                                .toStringAsFixed(0)));
                      } else if (((finalAngle * 180 / pi) + _currentValue) <=
                              59 &&
                          ((finalAngle * 180 / pi) + _currentValue) >= 0) {
                        _timer.cancel();
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
                onPressed: () {
                  _playBeep(_currentValue);
                  setState(() {
                    _isStarting = true;
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
              ElevatedButton(
                onPressed: _isStarting
                    ? () {
                        Navigator.of(context).push<void>(
                          HomePage.route(),
                        );
                        player.stop();
                        player.dispose();
                        _timer.cancel();
                      }
                    : null,
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
            ],
          ),
        ),
      ),
    );
  }
}
