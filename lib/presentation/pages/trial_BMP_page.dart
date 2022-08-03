import 'dart:async';

import 'package:Veris/data/models/user.dart';
import 'package:Veris/presentation/bloc/auth_bloc.dart';
import 'package:Veris/presentation/pages/body_map_page.dart';
import 'package:Veris/presentation/pages/home_page.dart';
import 'package:Veris/presentation/pages/knob_page.dart';
import 'package:Veris/style/theme.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Veris/presentation/utils/chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';

class TrialBMPPage extends StatefulWidget {
  const TrialBMPPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const TrialBMPPage());
  }

  @override
  State<TrialBMPPage> createState() => _TrialBMPPageState();
}

class _TrialBMPPageState extends State<TrialBMPPage>
    with SingleTickerProviderStateMixin {
  bool _toggled = false; // toggle button value
  List<SensorValue> _data = <SensorValue>[]; // array to store the values
  List<double> _bpmFirebase = <double>[];
  CameraController? _controller;
  double _alpha = 0.3; // factor for the mean value
  AnimationController? _animationController;
  double _iconScale = 1;
  int _bpm = 0; // beats per minute
  int _fs = 30; // sampling frequency (fps)
  int _windowLen = 30 * 6; // window length to display - 6 seconds
  CameraImage? _image; // store the last camera image
  double? _avg; // store the average value during calculation
  DateTime? _now; // store the now Datetime
  Timer? _timer; // timer for image processing
  int _start = 10;
  Timer? _timerDuration; // timer for duration

  final int _configMaxTrials = 5;
  final int _configRangeBodySelect = 2;
  int _countTrials = 0;
  int _currentStep = 1;
  List<int> listSelectSteps = [];
  bool _isFinished = false;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Map<String, List<double>> _trialBPMArray = {};

  @override
  initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animationController!
      ..addListener(() {
        setState(() {
          _iconScale = 1.0 + _animationController!.value * 0.4;
        });
      });

    listSelectSteps.add(_currentStep);
    _getNumTrial();
  }

  _getNumTrial() {
    String formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    _prefs.then((SharedPreferences p) {
      _countTrials = p.getInt('numRuns') ?? 0;
      p.setInt('maxTrials', _configMaxTrials);
      p.setString('startDate', formattedDate);
      print('COUNT $_countTrials');
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    if (_timerDuration != null) {
      _timerDuration!.cancel();
    }
    _toggled = false;
    _disposeController();
    Wakelock.disable();
    _animationController!.stop();
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push<void>(
                    HomePage.route(),
                  ),
              icon: const Icon(Icons.home))
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(18),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.center,
                            children: <Widget>[
                              _controller != null && _toggled
                                  ? AspectRatio(
                                      aspectRatio:
                                          _controller!.value.aspectRatio,
                                      child: CameraPreview(_controller!),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      color: Colors.grey,
                                    ),
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  _toggled
                                      ? "Cover both the camera and the flash with your finger"
                                      : "Camera feed will display here",
                                  style: TextStyle(
                                      backgroundColor: _toggled
                                          ? Colors.white
                                          : Colors.transparent),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Estimated BPM",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          Text(
                            (_bpm > 30 && _bpm < 150 ? _bpm.toString() : "--"),
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                    ),
                  ],
                )),
            Expanded(
              flex: 1,
              child: Center(
                child: Transform.scale(
                    scale: _iconScale,
                    child: _isFinished
                        ? ElevatedButton(
                            onPressed: () =>
                                (listSelectSteps.contains(_countTrials))
                                    ? Navigator.of(context)
                                        .push<void>(BodySelectPage.route())
                                    : Navigator.of(context)
                                        .push<void>(KnobPage.route()),
                            style: ElevatedButton.styleFrom(
                              primary: theme.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text('Continue'),
                          )
                        : _toggled
                            ? Text('$_start')
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: theme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_toggled) {
                                    _untoggle();
                                  } else {
                                    _toggle();
                                    await _calculateStep(_configMaxTrials,
                                        _configRangeBodySelect);
                                  }
                                },
                                child: const Text('START'),
                              )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    color: Colors.white),
                child: Chart(_data),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _calculateStep(int total, int range) {
    while (total >= _currentStep) {
      _currentStep += range;
      if (_currentStep <= total) {
        listSelectSteps.add(_currentStep);
      }
    }
  }

  void _clearData() {
    // create array of 128 ~= 255/2
    _data.clear();
    int now = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < _windowLen; i++)
      _data.insert(
          0,
          SensorValue(
              DateTime.fromMillisecondsSinceEpoch(now - i * 1000 ~/ _fs), 128));
  }

  void _toggle() {
    _clearData();
    _initController().then((onValue) async {
      Wakelock.enable();
      _animationController!.repeat(reverse: true);
      setState(() {
        _toggled = true;
      });

      // Map<String, dynamic> docData = {
      //   "startDate": DateTime.now(),
      //   "numTrials": 1,
      // };

      // if (countTrials > 0) {
      //   docData = {};
      // }

      // users
      //     .doc(user.id)
      //     .collection('trials')
      //     .doc(_formattedDate)
      //     .set(docData, SetOptions(merge: true));

      // after is toggled
      _initTimer();
      _countDown();
      _updateBPM();
    });
  }

  void _untoggle() async {
    final stringList = _bpmFirebase.map((e) => e.toString()).toList();
    // final String unixTime = (DateTime.now().millisecondsSinceEpoch).toString();
    _disposeController();
    Wakelock.disable();
    _animationController!.stop();
    _animationController!.value = 0.0;
    _timerDuration!.cancel();
    setState(() {
      _prefs.then((SharedPreferences p) {
        _countTrials++;
        p.setInt('numRuns', _countTrials);
        p.setStringList('instantBPM', stringList);
        print(p.getInt("numRuns").toString());
      });
      // _countTrials++;
      _toggled = false;
      _isFinished = true;
    });

    // _trialBPMArray[unixTime] = _bpmFirebase;
    // prefs.setStringList('instantBPM', stringList);
    // prefs.setString('startDate', DateTime.now().toString());
    // prefs.setInt('numRuns', countTrials);

    // final docData = {
    //   "instantBpms": _bpmFirebase,
    // };
    // if (_bpmFirebase != null) {
    //   users
    //       .doc(user.id)
    //       .collection('trials')
    //       .doc(_formattedDate)
    //       .collection('baselines')
    //       .doc()
    //       .set(docData, SetOptions(merge: true))
    //       .onError((e, _) => print("Error writing document: $e"));

    // prefs.setString('trialId', _formattedDate);
    // prefs.setString('userId', user.id);
    // prefs.setInt('countTrials', countTrials);
    // }

    _start = 10;
    _bpmFirebase = <double>[];
  }

  void _disposeController() {
    if (_controller != null) {
      _controller!.dispose();
    }
    _controller = null;
  }

  void _countDown() {
    _timerDuration = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) {
        if (_start == 0) {
          setState(() {
            _toggled = false;
            _untoggle();
            t.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Future<void> _initController() async {
    try {
      List _cameras = await availableCameras();
      _controller = CameraController(_cameras.first, ResolutionPreset.low);
      await _controller!.initialize();
      Future.delayed(const Duration(milliseconds: 100)).then((onValue) {
        _controller!.setFlashMode(FlashMode.torch);
      });
      _controller!.startImageStream((CameraImage image) {
        _image = image;
      });
    } catch (Exception) {
      debugPrint("Camera Error");
    }
  }

  void _initTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1000 ~/ _fs), (timer) {
      if (_toggled) {
        if (_image != null) _scanImage(_image!);
      } else {
        timer.cancel();
      }
    });
  }

  void _scanImage(CameraImage image) {
    _now = DateTime.now();
    _avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;
    if (_data.length >= _windowLen) {
      _data.removeAt(0);
    }
    setState(() {
      _data.add(SensorValue(_now!, 255 - _avg!));
    });
  }

  void _updateBPM() async {
    // Bear in mind that the method used to calculate the BPM is very rudimentar
    // feel free to improve it :)

    // Since this function doesn't need to be so "exact" regarding the time it executes,
    // I only used the a Future.delay to repeat it from time to time.
    // Ofc you can also use a Timer object to time the callback of this function
    List<SensorValue> _values;
    double _avg;
    int _n;
    double _m;
    double _threshold;
    double _bpm;
    int _counter;
    int _previous;
    while (_toggled) {
      _values = List.from(_data); // create a copy of the current data array
      _avg = 0;
      _n = _values.length;
      _m = 0;
      _values.forEach((SensorValue value) {
        _avg += value.value / _n;
        if (value.value > _m) _m = value.value;
      });
      _threshold = (_m + _avg) / 2;
      _bpm = 0;
      _counter = 0;
      _previous = 0;
      for (int i = 1; i < _n; i++) {
        if (_values[i - 1].value < _threshold &&
            _values[i].value > _threshold) {
          if (_previous != 0) {
            _counter++;
            _bpm += 60 *
                1000 /
                (_values[i].time.millisecondsSinceEpoch - _previous);
          }
          _previous = _values[i].time.millisecondsSinceEpoch;
        }
      }
      if (_counter > 0) {
        _bpm = _bpm / _counter;
        print('BMP $_bpm');

        _bpmFirebase.add(_bpm);

        setState(() {
          this._bpm = ((1 - _alpha) * this._bpm + _alpha * _bpm).toInt();
        });
      }
      await Future.delayed(
          Duration(milliseconds: 1000)); // wait for a new set of _data values
    }
  }
}
