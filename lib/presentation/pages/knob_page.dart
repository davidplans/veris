import 'dart:async';
import 'dart:math';

import 'package:Veris/data/models/user.dart';
import 'package:Veris/presentation/bloc/auth_bloc.dart';
import 'package:Veris/presentation/pages/home_page.dart';
import 'package:Veris/presentation/pages/trial_BMP_page.dart';
import 'package:Veris/style/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/widget_v318.dart';

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
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late User user;
  late int lastSetNumber;
  late String studyId;
  int _completeTrials = 0;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences p) {
      _completeTrials = p.getInt('completeTrials') ?? 0;
      _completeTrials++;
      studyId = p.getString('studyId') ?? "";
      setState(() {});
    });
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
    user = context.select((AuthBloc bloc) => bloc.state.user);

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Trial: $_completeTrials',
                  style: const TextStyle(
                    fontSize: 26.0,
                  )),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    "Move the dial until the tone matches your heart-beat, to the best of your perception. Please press confirm when you are done.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    )),
              ),
              // Text(_isStarting ? _calculateBeatsToString() : "",
              //     style: const TextStyle(
              //       fontSize: 50,
              //     )),
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
                        Offset centerOfGestureDetector = Offset(
                            constraints.maxWidth / 2,
                            constraints.maxHeight / 2);
                        final touchPositionFromCenter =
                            details.localPosition - centerOfGestureDetector;

                        setState(
                          () {
                            _isStarting = true;
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
              //     backgroundColor: theme.primaryColor,
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
                        final prefs = await SharedPreferences.getInstance();

                        final selectedBody = prefs.getString('selectedBody');
                        final maxTrials = prefs.getInt('maxTrials');
                        final startTrial = prefs.getString('startTrial');
                        final startSet = prefs.getString('startSet');
                        final numRuns = prefs.getInt('numRuns');
                        final knobScales = prefs.getStringList('knobScales');
                        var numSet = prefs.getInt('numSet') ?? 0;
                        final instantBPMs = prefs.getStringList('instantBPMs');
                        final instantPeriods =
                            prefs.getStringList('instantPeriods');
                        final averagePeriods =
                            prefs.getStringList('averagePeriods');
                        final instantErrs = prefs.getStringList('instantErrs');
                        final currentDelays =
                            prefs.getStringList('currentDelays');

                        prefs.setInt('completeTrials', numRuns ?? 0);
                        print(currentDelays);
                        DateTime formatDateTrial = DateTime.now();
                        DateTime formatDateSet = DateTime.now();
                        DateFormat format = DateFormat('yyyy-MM-dd – kk:mm');
                        if (startTrial != null) {
                          formatDateTrial = format.parse(startTrial);
                        }
                        if (startSet != null) {
                          formatDateSet = format.parse(startSet);
                        }

                        List<double> doubleInstantBPMs = [];
                        if (instantBPMs != null) {
                          doubleInstantBPMs =
                              instantBPMs.map(double.parse).toList();
                        }

                        List<double> doubleInstantPeriods = [];
                        if (instantPeriods != null) {
                          doubleInstantPeriods =
                              instantPeriods.map(double.parse).toList();
                        }

                        List<double> doubleAveragePeriods = [];
                        if (averagePeriods != null) {
                          doubleAveragePeriods =
                              averagePeriods.map(double.parse).toList();
                        }

                        List<double> doubleInstantErrs = [];
                        if (instantErrs != null) {
                          doubleInstantErrs =
                              instantErrs.map(double.parse).toList();
                        }

                        List<double> doubleCurrentDelays = [];
                        if (currentDelays != null) {
                          doubleCurrentDelays =
                              currentDelays.map(double.parse).toList();
                        }

                        List<double> doubleKnobScales = [];
                        if (knobScales != null) {
                          doubleKnobScales =
                              knobScales.map(double.parse).toList();
                        }

                        final setData = {"startSet": formatDateSet};

                        final trialData = {
                          "userId": user.id,
                          "studyId": studyId,
                          "numRuns": numRuns,
                          "startTrial": formatDateTrial,
                          "selectedBody": selectedBody,
                          "compareBeats": _calculateBeatsToDouble().round(),
                          "endDate": DateTime.now(),
                          "instantBPMs": doubleInstantBPMs,
                          "recordedHR": doubleAveragePeriods,
                          "knobScales": doubleKnobScales,
                          "currentDelays": doubleCurrentDelays,
                          "instantPeriods": doubleInstantPeriods,
                          "averagePeriods": doubleAveragePeriods,
                          "instantErrs": doubleInstantErrs,
                        };
                        // print(trialData);
                        final String unixTime =
                            (DateTime.now().millisecondsSinceEpoch).toString();

                        numSet++;

                        // prefs.setInt('numSet', numSet);
                        final lastSetData = {"last_set_number": numSet};
                        users
                            .doc(user.id)
                            .set(lastSetData, SetOptions(merge: true))
                            .whenComplete(() {
                          users
                              .doc(user.id)
                              .collection('studies')
                              .doc()
                              .set(trialData, SetOptions(merge: true))
                              .then((_) {
                            if (maxTrials == numRuns) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 5),
                                  content: Text("Data stored! \n Thank you."),
                                ),
                              );
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const V318Widget(),
                                ),
                              );
                            } else {
                              Navigator.of(context).push<void>(
                                TrialBMPPage.route(),
                              );
                            }
                          });
                        });

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
