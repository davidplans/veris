import 'dart:async';
import 'dart:math';

import 'package:Veris/presentation/widgets/widget_v311_trial1.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../style/theme.dart';
import 'widget_v314_trial2.dart';

class V313Trial2Widget extends StatefulWidget {
  const V313Trial2Widget({super.key});

  @override
  State<V313Trial2Widget> createState() => _V313Trial2WidgetState();
}

class _V313Trial2WidgetState extends State<V313Trial2Widget> {
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
        player.setVolume(0.3);
        player.setSpeed(
            // beep.mp3 duration 0.862 / 1.1602 = 1.000 sec
            double.parse(
                ((speed / 60) / _durationToOneSec).toStringAsFixed(3)));

        player.play();
      } else if (speed <= 59) {
        player.setLoopMode(LoopMode.off);
        // _timer.cancel();

        _timer = Timer.periodic(
            Duration(milliseconds: ((60 / (speed)) * 1000).round()), (t) {
          player.stop();
          player.setAudioSource(source);
          player.setVolume(0.3);
          player.play();
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

  String _calculateBeatsToString() {
    return ((finalAngle * 180 / pi) + _currentValue).toStringAsFixed(0);
  }

  double _calculateBeatsToDouble() {
    return ((finalAngle * 180 / pi) + _currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Veris - PRACTICE TRIAL 2'),
          automaticallyImplyLeading: false),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    "Move the dial until the tone matches your haert-beat, to the best of your perception. Please press confirm when you are done.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    )),
              ),
              // const SizedBox(height: 50),
              Text(_isStarting ? _calculateBeatsToString() : "",
                  style: const TextStyle(
                    fontSize: 50,
                  )),
              const SizedBox(height: 40),
              Container(
                  width: 250,
                  height: 250,
                  color: Colors.white,
                  child:
                      // _isStarting
                      //     ?
                      LayoutBuilder(builder: (context, constraints) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onPanUpdate: (details) {
                        // _playBeep(_currentValue);
                        Offset centerOfGestureDetector = Offset(
                            constraints.maxWidth / 2,
                            constraints.maxHeight / 2);
                        final touchPositionFromCenter =
                            details.localPosition - centerOfGestureDetector;

                        setState(
                          () {
                            _isStarting = true;
                            print('ROTATE');
                            if (((touchPositionFromCenter.direction *
                                        180 /
                                        pi) +
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
                                ((touchPositionFromCenter.direction *
                                            180 /
                                            pi) +
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
                        if (_calculateBeatsToDouble() >= 60) {
                          _timer.cancel();
                          _changeKnob(double.parse(_calculateBeatsToString()));
                        } else if (_calculateBeatsToDouble() <= 59 &&
                            _calculateBeatsToDouble() >= 0) {
                          _timer.cancel();
                          _changeKnob(double.parse(_calculateBeatsToString()));
                        }
                      },
                      child: Transform.rotate(
                        angle: finalAngle,
                        child: const Image(
                          image: AssetImage("assets/images/knob.png"),
                        ),
                      ),
                    );
                  })
                  // : null,
                  ),
              const SizedBox(height: 40),
              // ElevatedButton(
              //   onPressed: !_isStarting
              //       ? () {
              //           _playBeep(_currentValue);
              //           setState(() {
              //             _isStarting = true;
              //           });
              //         }
              //       : null,
              //   style: ElevatedButton.styleFrom(
              //     primary: theme.primaryColor,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //   ),
              //   child: const Text(
              //     'Move',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              ElevatedButton(
                onPressed: _isStarting
                    ? () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const V314Trial2Widget(),
                          ),
                        );
                        player.stop();
                        player.dispose();
                        _timer.cancel();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
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
