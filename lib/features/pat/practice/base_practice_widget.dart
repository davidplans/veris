import 'dart:async';

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/core/utils/image_constant.dart';
import 'package:Veris/features/pat/shared/wrong_finger_place.dart';
import 'package:Veris/features/pat/view/confidence_slider_page.dart';
import 'package:Veris/features/pat/view/partials/heart_bpm_widget.dart';
import 'package:Veris/features/pat/view/partials/knob_widget.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PracticeWidget extends StatefulWidget {
  const PracticeWidget({super.key});

  @override
  State<PracticeWidget> createState() => _PracticeWidgetState();
}

class _PracticeWidgetState extends State<PracticeWidget> {
  double _instantBpm = 0;
  double _averagePeriod = 0;
  double _instantPeriod = 0;
  double _instantErr = 0;
  double _averageBpm = 0;

  double _currentKnobValue = 0;

  final double _secondsPerMin = 60.0;
  final double _shortestDelay = 60.0 / 140.0;
  final double _knobValueRange = 1;

  final _player = AudioPlayer();

  bool _isNoFinger = false;
  bool _isBPMEnabled = true;

  int _configMaxTrials = 20;
  int _configStepBodySelect = 5;
  int _practiceTrialNumber = 1;

  final List<int> _instantBPMs = <int>[];

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
    _getTrialConfig();
  }

  _initAudioPlayer() async {
    await _player.setLoopMode(LoopMode.off);
  }

  _getTrialConfig() async {
    final prefs = await SharedPreferences.getInstance();
    _configMaxTrials = prefs.getInt('maxTrials') ?? 20;
    _configStepBodySelect = prefs.getInt('stepBodySelect') ?? 5;
    _practiceTrialNumber = prefs.getInt('practiceTrialNumber') == 1 ? 2 : 1;
    await prefs.remove('completeTrials');
    setState(() {});
  }

  @override
  void dispose() {
    _deInit();
    super.dispose();
  }

  void _deInit() async {
    _player.stop();
    _player.dispose();
    _isNoFinger = false;
  }

  _beatDetected(int instantBPM) async {
    final double currentInstantPeriod = _instantPeriod;
    _instantBpm = instantBPM.toDouble();
    _instantPeriod = _secondsPerMin / _instantBpm;
    _instantErr = currentInstantPeriod - _instantPeriod;
    _averageBpm = _instantBPMs.reduce((value, element) => value + element) /
        _instantBPMs.length;
    _averagePeriod = _secondsPerMin / _averageBpm;

    double delayFromNow = _currentDelay() < 0
        ? _instantPeriod + _currentDelay()
        : _currentDelay();

    await Future.delayed(Duration(milliseconds: (delayFromNow * 1000).toInt()));
    _player
        .setAudioSource(
            AudioSource.uri(Uri.parse('asset:///assets/sounds/2.mp3')))
        .then((value) {
      _player.play().whenComplete(() => _player.stop());
    });
  }

  double _currentDelay() {
    if (_averagePeriod != 0) {
      return (_averagePeriod / 2) * _currentKnobValue;
    } else {
      return _shortestDelay;
    }
  }

  void _redirectToSlider(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    switch (_practiceTrialNumber) { 
      case 1:
     await prefs.setInt("practiceTrialNumber", _practiceTrialNumber);
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ConfidenceSliderPage(
              practiceTrialNumber: _practiceTrialNumber,
            ),
          ),
        );
        break;
      case 2:
      await prefs.setInt("practiceTrialNumber", _practiceTrialNumber);
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ConfidenceSliderPage(
              practiceTrialNumber: _practiceTrialNumber,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBarWidget(
              title:
                  "Veris - PRACTICE TRIAL ${_practiceTrialNumber.toString()}"),
          body: SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            const Text(
                              'Config',
                              textAlign: TextAlign.center,
                            ),
                            Text('Total trials - $_configMaxTrials',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text('BodySelect - $_configStepBodySelect',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                    _isBPMEnabled
                        ? HeartBPM(
                            context: context,
                            onFingerPresentChanged: (isPresent) => setState(() {
                              _isNoFinger = isPresent;
                            }),
                            onBPM: (instantBPM) => setState(() {
                              if (_instantBPMs.length >= 100) {
                                _instantBPMs.removeAt(0);
                              }
                              _instantBPMs.add(instantBPM);
                              _beatDetected(instantBPM);
                            }),
                          )
                        : Container(
                            constraints: const BoxConstraints.tightFor(
                              width: 100,
                              height: 130,
                            ),
                          ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                      "Move the dial until the tone matches your heart-beat, to the best of your perception. Please press confirm when you are done.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      )),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.white,
                  child: Stack(children: [
                    Image(
                      image: AssetImage(ImageConstant.imgKnob),
                    ),
                    KnobWidget(
                      currentKnobValue: _currentKnobValue,
                      knobValueRange: _knobValueRange,
                      onChangedKnobValue: (changedKnobValue) => setState(() {
                        _currentKnobValue = changedKnobValue;
                      }),
                    ),
                  ]),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 15, 32, 66),
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    child: const Text("Confirm"),
                    onPressed: () {
                      setState(() {
                        if (_isBPMEnabled) {
                          _isBPMEnabled = false;
                        }
                      });
                      _deInit();
                      _redirectToSlider(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
         WrongFingerPlace(isNoFinger: _isNoFinger),
      ],
    );
  }
}
