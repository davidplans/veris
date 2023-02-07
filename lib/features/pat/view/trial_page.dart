import 'dart:async';
import 'dart:math' as math;

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/features/pat/shared/wrong_finger_place.dart';
import 'package:Veris/features/pat/view/confidence_slider_page.dart';
import 'package:Veris/utils/image_processing.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'body_select_page.dart';

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

  /// Camera controller
  CameraController? _controller;

  /// Used to set sampling rate
  bool _processing = false;

  /// Current value
  int currentValue = 0;

  /// to ensure camara was initialized
  bool _isCameraInitialized = false;

  double _max = 0;

  List<double> _instantBPMs = <double>[];
  List<double> _instantPeriods = <double>[];
  List<double> _averagePeriods = <double>[];
  List<double> _instantErrs = <double>[];
  List<double> _currentDelays = <double>[];
  List<double> _knobScales = <double>[];

  Timer? _timer;

  int _counter = 0;

  final _player = AudioPlayer();

  int _sampleDelay = 2000 ~/ 30;

  double alpha = 0.8;

  bool _isFinished = false;

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

  double _range = 1;

  double _normalisedValue = 0;

  double _currentKnobValue = 0;

  double _shiftedRad = 0;

  double _rad = 0;

  // ############### END #############

  @override
  void initState() {
    super.initState();
    _initController();
    listSelectSteps.add(_currentStep);
    _getNumTrial();
  }

  @override
  void dispose() {
    _deinitController();
    super.dispose();
  }

  /// Deinitialize the camera controller
  void _deinitController() async {
    _player.stop();
    _player.dispose();
    _isFinished = true;
    _isCameraInitialized = false;
    _isNoFinger = false;

    if (_controller == null) return;
    await _controller!.dispose();
    if (_timer != null) _timer?.cancel();
  }

  void _confirm() async {
    final instantBPMs = _instantBPMs.map((e) => e.toString()).toList();
    final instantPeriods = _instantPeriods.map((e) => e.toString()).toList();
    final averagePeriods = _averagePeriods.map((e) => e.toString()).toList();
    final instantErrs = _instantErrs.map((e) => e.toString()).toList();
    final currentDelays = _currentDelays.map((e) => e.toString()).toList();
    final knobScales = _knobScales.map((e) => e.toString()).toList();

    setState(() {
      _prefs.then((SharedPreferences p) {
        _countTrials++;
        p.setInt('numRuns', _countTrials);
        p.setStringList('instantBPMs', instantBPMs);
        p.setStringList('instantPeriods', instantPeriods);
        p.setStringList('averagePeriods', averagePeriods);
        p.setStringList('instantErrs', instantErrs);
        p.setStringList('knobScales', knobScales);
        p.setStringList('currentDelays', currentDelays);
        p.setString('selectedBody', '');
      });
    });

    _instantBPMs.clear();
    _instantPeriods.clear();
    _averagePeriods.clear();
    _instantErrs.clear();
    _currentDelays.clear();
    _knobScales.clear();
  }

  /// Initialize the camera controller
  ///
  /// Function to initialize the camera controller and start data collection.
  Future<void> _initController() async {
    _player.setLoopMode(LoopMode.off);

    if (_controller != null) return;
    try {
      // 1. get list of all available cameras
      List<CameraDescription> cameras = await availableCameras();
      // 2. assign the preferred camera with low resolution and disable audio
      _controller = CameraController(cameras.first, ResolutionPreset.low,
          enableAudio: false);

      // 3. initialize the camera
      await _controller!.initialize();

      // 4. set torch to ON and start image stream
      Future.delayed(const Duration(milliseconds: 500))
          .then((value) => _controller!.setFlashMode(FlashMode.torch));

      // 5. register image streaming callback

      _controller!.startImageStream((image) {
        if (!_processing && mounted) {
          _processing = true;
          _scanImage(image);
        }
      });

      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      print(e);
      throw e;
    }

    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (_instantBPMs != null && _instantBPMs.isNotEmpty) {
        _instantBPMs.clear();
      }
    });
  }

  _getNumTrial() {
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

  _randomGen(min, max) {
    math.Random random = math.Random();
    double rand = random.nextDouble() * (random.nextBool() ? -1 : 1);
    return rand;
  }

  static const int windowLength = 50;
  final List<SensorValue> measureWindow = List<SensorValue>.filled(
      windowLength, SensorValue(DateTime.now(), 0),
      growable: true);

  void _scanImage(CameraImage image) {
    _isNoFinger = !ImageProcessing.isAvailableFingerOnCamera(image);

    // get the average value of the image
    double avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;
    if (avg > _max) {
      _max = avg;
      _counter++;
      if (_counter >= 6) {
        _mainCalculate();
        _player
            .setAudioSource(
                AudioSource.uri(Uri.parse('asset:///assets/sounds/2.mp3')))
            .then((value) {
          _player.play().whenComplete(() => _player.stop());
        });
        _counter = 0;
      }
    } else {
      _max = 0;
      _counter = 0;
    }
    measureWindow.removeAt(0);
    measureWindow.add(SensorValue(DateTime.now(), avg));

    _udateBPM(avg).then((value) {
      Future<void>.delayed(Duration(milliseconds: _sampleDelay))
          .then((onValue) {
        if (mounted) {
          setState(() {
            _processing = false;
          });
        }
      });
    });
  }

  _mainCalculate() {
    _normalisedValue = (_currentKnobValue + _range) / (2 * _range);
    _shiftedRad = _normalisedValue * (2 * math.pi);
    _rad = (_shiftedRad - math.pi);
    if (_currentKnobValue == 0) {
      _currentKnobValue = _randomGen(-1, 1);
    }
  }

  _calculateStep(int total, int range) {
    while (total >= _currentStep) {
      _currentStep += range;
      if (_currentStep <= total) {
        listSelectSteps.add(_currentStep);
      }
    }
  }

  /// Smooth the raw measurements using Exponential averaging
  /// the scaling factor [alpha] is used to compute exponential moving average of the
  /// realtime data using the formula:
  /// ```
  /// $y_n = alpha * x_n + (1 - alpha) * y_{n-1}$
  /// ```
  Future<int> _udateBPM(double newValue) async {
    double maxVal = 0, avg = 0;

    for (var element in measureWindow) {
      avg += element.value / measureWindow.length;
      if (element.value > maxVal) maxVal = element.value as double;
    }

    double threshold = (maxVal + avg) / 2;
    int _count = 0, previousTimestamp = 0;
    double tempBPM = 0;
    for (int i = 1; i < measureWindow.length; i++) {
      // find rising edge
      if (measureWindow[i - 1].value < threshold &&
          measureWindow[i].value > threshold) {
        if (previousTimestamp != 0) {
          _count++;
          tempBPM += 60000 /
              (measureWindow[i].time.millisecondsSinceEpoch -
                  previousTimestamp); // convert to per minute
        }
        previousTimestamp = measureWindow[i].time.millisecondsSinceEpoch;
      }
    }

    if (_count > 0) {
      tempBPM = tempBPM / _count;

      double previousInstantPeriod = 0;
      if (_instantPeriods.isNotEmpty) {
        previousInstantPeriod = _instantPeriods[_instantPeriods.length - 1];
      }

      // _instantBPMs.add(tempBPM);
      final double instantPeriod = 60 / tempBPM;
      _instantPeriods.add(instantPeriod);
      int count = _instantPeriods.length;
      double sum = _instantPeriods.fold<double>(
          0, (double sum, double item) => sum + item);
      double averagePeriod = sum / count;
      _averagePeriods.add(averagePeriod);
      double currentDelay = (averagePeriod / 2) * _currentKnobValue;
      _currentDelays.add(currentDelay);
      _knobScales.add(_currentKnobValue);
      if (previousInstantPeriod != 0) {
        final instantErr = previousInstantPeriod - instantPeriod;
        _instantErrs.add(instantErr);
      }
      tempBPM = (1 - alpha) * currentValue + alpha * tempBPM;
      _instantBPMs.add(tempBPM);

      setState(() {
        currentValue = tempBPM.toInt();
      });
    }
    return currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBarWidget(title: "Veris - TRIALs"),
        body: Container(
            child: _isCameraInitialized
                ? Column(
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
                          Expanded(
                            flex: 1,
                            child: Container(
                              constraints: const BoxConstraints.tightFor(
                                  width: 100, height: 130),
                              child: _controller!.buildPreview(),
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
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
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
                          child: LayoutBuilder(builder: (context, constraints) {
                            return _isFinished
                                ? Container()
                                : GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onPanUpdate: (details) {
                                      Offset centerOfGestureDetector = Offset(
                                          constraints.maxWidth / 2,
                                          constraints.maxHeight / 2);
                                      final touchPositionFromCenter =
                                          details.localPosition -
                                              centerOfGestureDetector;

                                      setState(
                                        () {
                                          _currentKnobValue =
                                              ((touchPositionFromCenter
                                                      .direction /
                                                  math.pi));

                                          finalAngle =
                                              touchPositionFromCenter.direction;
                                          print(_currentKnobValue);
                                        },
                                      );
                                    },
                                    child: Transform.rotate(
                                      angle: finalAngle,
                                      child: const Image(
                                        image: AssetImage(
                                            "assets/images/knob.png"),
                                      ),
                                    ),
                                  );
                          })),
                      const SizedBox(height: 40),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 15, 32, 66),
                            textStyle: const TextStyle(color: Colors.white),
                          ),
                          child: const Text("Confirm"),
                          onPressed: () {
                            setState(() {
                              _deinitController();
                              _confirm();
                            });
                          },
                        ),
                      )
                    ],
                  )
                : const Center(child: CircularProgressIndicator())),
      ),
      WrongFingerPlace(isNoFinger: _isNoFinger),
      _isFinished
          ? Scaffold(
              appBar: AppBarWidget(title: "Veris - TRIALs"),
              body: Container(
                child: Column(
                  children: [
                    const SizedBox(height: 130),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text("",
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
                        child: const Text('')),
                    const SizedBox(height: 40),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 15, 32, 66),
                            textStyle: const TextStyle(color: Colors.white),
                          ),
                          child: const Text("Continue"),
                          onPressed: () {
                            (listSelectSteps.contains(_countTrials))
                                ? Navigator.of(context)
                                    .push<void>(BodySelectPage.route())
                                : Navigator.of(context)
                                    .push<void>(ConfidenceSliderPage.route());
                          }),
                    ),
                  ],
                ),
              ),
            )
          : Container()
    ]);
  }
}

class SensorValue {
  final DateTime time;
  final double value;

  SensorValue(this.time, this.value);
}
