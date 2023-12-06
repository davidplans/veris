import 'dart:async';
import 'dart:math' as math;

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/core/utils/image_constant.dart';
import 'package:Veris/features/pat/shared/wrong_finger_place.dart';
import 'package:Veris/features/pat/view/confidence_slider_page.dart';
import 'package:Veris/features/pat/view/partials/heart_bpm_widget.dart';
import 'package:Veris/features/pat/view/partials/knob_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TrialPage extends StatefulWidget {
  const TrialPage({super.key});
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const TrialPage());
  }

  @override
  State<TrialPage> createState() => _TrialPageState();
}

class _TrialPageState extends State<TrialPage> {
// ########## BPM VARs #############

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
  int _completeTrials = 0;

  final List<int> _instantBPMs = <int>[];
  final List<double> _instantPeriods = <double>[];
  final List<double> _averagePeriods = <double>[];
  final List<double> _knobScales = <double>[];
  final List<double> _instantErrs = <double>[];
  final List<double> _currentDelays = <double>[];

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
    _startRandomGeneration();
    _getTrialConfig();
  }

  _startRandomGeneration() {
    _currentKnobValue = _randomGeneration(_knobValueRange);
  }

  _initAudioPlayer() async {
    await _player.setLoopMode(LoopMode.off);
  }

  _getTrialConfig() async {
    final prefs = await SharedPreferences.getInstance();
    String formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    _completeTrials = prefs.getInt('completeTrials') ?? 0;
    _configMaxTrials = prefs.getInt('maxTrials') ?? 20;
    _configStepBodySelect = prefs.getInt('stepBodySelect') ?? 5;
    await prefs.setString('startTrial', formattedDate);
    setState(() {});
  }

  double _randomGeneration(double range) {
    math.Random random = math.Random();
    double rand = random.nextDouble() * (random.nextBool() ? -range : range);
    return rand;
  }

  _beatDetected(int instantBPM) async {
    final double currentInstantPeriod = _instantPeriod;
    _instantBpm = instantBPM.toDouble();
    _instantPeriod = _secondsPerMin / _instantBpm;
    _instantErr = currentInstantPeriod - _instantPeriod;
    _averageBpm = _instantBPMs.reduce((value, element) => value + element) /
        _instantBPMs.length;
    _averagePeriod = _secondsPerMin / _averageBpm;

    _instantPeriods.add(_instantPeriod);
    _averagePeriods.add(_averagePeriod);
    _instantErrs.add(_instantErr);
    _knobScales.add(_currentKnobValue);
    _currentDelays.add(_currentDelay());

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

  void _confirmAndSave() async {
    final prefs = await SharedPreferences.getInstance();
    // final instantBPMs = _instantBPMs.map((e) => e.toString()).toList();
    final instantPeriods = _instantPeriods.map((e) => e.toString()).toList();
    final averagePeriods = _averagePeriods.map((e) => e.toString()).toList();
    final instantErrs = _instantErrs.map((e) => e.toString()).toList();
    final knobScales = _knobScales.map((e) => e.toString()).toList();
    final currentDelays = _currentDelays.map((e) => e.toString()).toList();

    await prefs.setStringList('instantPeriods', instantPeriods);
    await prefs.setStringList('averagePeriods', averagePeriods);
    await prefs.setStringList('instantErrs', instantErrs);
    await prefs.setStringList('knobScales', knobScales);
    await prefs.setStringList('currentDelays', currentDelays);
    await prefs.setString('selectedBody', '');

    setState(() {});

    // _instantBPMs.clear();
    _instantPeriods.clear();
    _averagePeriods.clear();
    _instantErrs.clear();
    _knobScales.clear();
    _currentDelays.clear();
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
                    if (_isBPMEnabled) {
                      _isBPMEnabled = false;
                    }
                  });
                  _confirmAndSave();
                  _deInit();
                  Navigator.of(context)
                      .push<void>(ConfidenceSliderPage.route());
                  // (listSelectSteps.contains(_countTrials))
                  //     ? Navigator.of(context).push<void>(BodySelectPage.route())
                  //     : Navigator.of(context)
                  //         .push<void>(ConfidenceSliderPage.route());
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
