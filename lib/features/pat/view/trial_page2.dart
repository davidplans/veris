import 'dart:async';
import 'dart:math' as math;

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/core/utils/image_constant.dart';
import 'package:Veris/features/pat/models/sensor.dart';
import 'package:Veris/features/pat/shared/wrong_finger_place.dart';
import 'package:Veris/features/pat/view/body_select_page.dart';
import 'package:Veris/features/pat/view/confidence_slider_page.dart';
import 'package:Veris/features/pat/view/partials/heart_bpm_widget.dart';
import 'package:Veris/features/pat/view/partials/knob_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TrialPage2 extends StatefulWidget {
  const TrialPage2({super.key});
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const TrialPage2());
  }

  @override
  State<TrialPage2> createState() => _TrialPage2State();
}

class _TrialPage2State extends State<TrialPage2> {
// ########## BPM VARs #############

  bool isBPMEnabled = true;

  double _instantBpm = 0;
  double _averagePeriod = 0;
  double _instantPeriod = 0;
  double _instantErr = 0;

  double _averageBpm = 0;

  final _secondsPerMin = 60.0;
  final _shortestDelay = 60.0 / 140.0;

  final _player = AudioPlayer();

  // bool _isFinished = false;

  bool _isNoFinger = false;

  double finalAngle = 0.0;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int _configMaxTrials = 20;
  int _configStepBodySelect = 5;
  int _countTrials = 0;
  int _completeTrials = 0;
  int _currentStep = 1;
  List<int> listSelectSteps = [];

  // PROCESSING VARS

  final double _knobValueRange = 1;

  // double instantBpm = 0;
  // double averageBpm = 0;
  // double averagePeriod = 0;
  // double instantPeriod = 0;
  // double instantErr = 0;

  List<int> _instantBPMs = <int>[];

  List<double> _instantPeriods = <double>[];
  List<double> _averagePeriods = <double>[];
  List<double> _knobScales = <double>[];
  List<double> _instantErrs = <double>[];
  List<double> _currentDelays = <double>[];

  double _normalisedValue = 0;

  double _currentKnobValue = 0;

  double _shiftedRad = 0;

  double _rad = 0;

  // List<double> bpmValues = [];

  // ############### END #############

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
    _start();
    listSelectSteps.add(_currentStep);
    _getTrialConfig();
  }

  _start() {
    _currentKnobValue = _randomGeneration(_knobValueRange);
  }

  _initAudioPlayer() async {
    await _player.setLoopMode(LoopMode.off);
  }

  _getTrialConfig() {
    String formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    _prefs.then((SharedPreferences p) {
      _countTrials = p.getInt('numRuns') ?? 0;
      _completeTrials = p.getInt('completeTrials') ?? 0;
      _configMaxTrials = p.getInt('maxTrials') ?? 20;
      _configStepBodySelect = p.getInt('stepBodySelect') ?? 5;
      p.setString('startTrial', formattedDate);
      _calculateStep(_configMaxTrials, _configStepBodySelect);
      setState(() {});
    });
  }

  _calculateStep(int total, int range) {
    while (total >= _currentStep) {
      _currentStep += range;
      if (_currentStep <= total) {
        listSelectSteps.add(_currentStep);
      }
    }
  }

  double _randomGeneration(double range) {
    math.Random random = math.Random();
    double rand = random.nextDouble() * (random.nextBool() ? -range : range);
    return rand;
  }

  _beatDetected(int instantBPM) async {
    final double currentInstantPeriod = _instantPeriod;
    // print('CURRENTINSTANTPERIOD: ${currentInstantPeriod}');
    _instantBpm = instantBPM.toDouble();
    // print('_INSTANTBPM: ${_instantBpm}');
    _instantPeriod = _secondsPerMin / _instantBpm;
    // print('_INSTANTPERIOD: ${_instantPeriod}');
    _instantErr = currentInstantPeriod - _instantPeriod;
    // print('_INSTANTERR: ${_instantErr}');
    _averageBpm = _instantBPMs.reduce((value, element) => value + element) /
        _instantBPMs.length;
    // print('_AVERAGEBPM: ${_averageBpm}');
    _averagePeriod = _secondsPerMin / _averageBpm;
    // print('_AVERAGEPERIOD: ${_averagePeriod}');

    _instantPeriods.add(_instantPeriod);
    _averagePeriods.add(_averagePeriod);
    _knobScales.add(_currentKnobValue);
    _instantErrs.add(_instantErr);
    _currentDelays.add(_currentDelay());

    double delayFromNow = _currentDelay() < 0
        ? _instantPeriod + _currentDelay()
        : _currentDelay();
    // print('_DELAYFROMNOW: ${_delayFromNow}');
    print('BEAT CURRENTKNOBVALUE: ${_currentKnobValue}');
    // print('_CURRENTDELAY: ${_currentDelay()}');
    print('++++++++++++++++++++++++++++++++++++');

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

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: const AppBarWidget(title: "Veris - TRIALs"),
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
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text('BodySelect - $_configStepBodySelect',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )),
                isBPMEnabled
                    ? HeartBPM(
                        context: context,
                        onFingerPresentChanged: (isPresent) => setState(() {
                          // _isNoFinger = isPresent;
                        }),
                        onBPM: (instantBPM) => setState(() {
                          if (_instantBPMs.length >= 100) {
                            _instantBPMs.removeAt(0);
                          }
                          _instantBPMs.add(instantBPM);
                          _beatDetected(instantBPM);
                          print('instantBPM: ${instantBPM}');
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
                    child: Column(
                      children: [
                        const Text(
                          'Complete trial:',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "$_completeTrials of $_configMaxTrials",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
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
                    if (isBPMEnabled) {
                      isBPMEnabled = false;
                    }
                    _deInit();
                  });
                  (listSelectSteps.contains(_countTrials))
                      ? Navigator.of(context).push<void>(BodySelectPage.route())
                      : Navigator.of(context)
                          .push<void>(ConfidenceSliderPage.route());
                },
              ),
            )
          ],
        )),
      ),
      WrongFingerPlace(isNoFinger: _isNoFinger),
    ]);
  }
}
