import 'dart:async';

import 'package:Veris/presentation/pages/home_page.dart';
import 'package:Veris/style/theme.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Veris/presentation/utils/chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wakelock/wakelock.dart';

import '../../data/models/user.dart';
import '../bloc/auth_bloc.dart';

class BaselineWidget extends StatefulWidget {
  const BaselineWidget({Key? key}) : super(key: key);

  // static Route route() {
  //   return MaterialPageRoute<void>(builder: (_) => const BaselineWidget());
  // }

  @override
  State<BaselineWidget> createState() => _BasetineWidgetState();
}

class _BasetineWidgetState extends State<BaselineWidget>
    with SingleTickerProviderStateMixin {
  bool _toggled = false; // toggle button value
  List<SensorValue> _data = <SensorValue>[]; // array to store the values
  List<double> _instantBPMs = <double>[];
  // List<double> _instantPeriods = <double>[];
  // List<double> _averagePeriods = <double>[];
  // List<double> _instantErrs = <double>[];
  // List<double> _currentDelays = <double>[];
  // List<double> _knobScales = <double>[];

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
  int _start = 60;
  Timer? _timerDuration; // timer for duration

  // int _configMaxTrials = 0;
  // int _configStepBodySelect = 0;
  // int _countTrials = 0;
  // int _currentStep = 1;
  // int _completeTrials = 0;
  // List<int> listSelectSteps = [];
  bool _isFinished = false;
  String _startDate = "";

  // late double _currentKnobValue;

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late User user;

  // // Map<String, List<double>> _trialBPMArray = {};

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
    // _getConfig();
    // _getNumTrial();
    // _currentKnobValue = _randomGen(-1, 1);
    // listSelectSteps.add(_currentStep);
  }

  // _getNumTrial() {
  //   String formattedDate =
  //       DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  //   _prefs.then((SharedPreferences p) {
  //     _countTrials = p.getInt('numRuns') ?? 0;
  //     _completeTrials = p.getInt('completeTrials') ?? 0;
  //     p.setInt('maxTrials', _configMaxTrials);
  //     p.setString('startTrial', formattedDate);
  //     setState(() {});
  //     print('COUNT $_countTrials');
  //   });
  // }

  // _getConfig() {
  //   final docRef = config.doc("veris");

  //   docRef.get().then(
  //     (DocumentSnapshot doc) {
  //       final data = doc.data() as Map<String, dynamic>;
  //       print(data.toString());
  //       setState(() {
  //         _configMaxTrials = data['maxTrialsConfig'] ?? 20;
  //         _configStepBodySelect = data['stepToBodySelect'] ?? 5;
  //       });
  //     },
  //     onError: (e) => print("Error getting document: $e"),
  //   );
  // }

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
    print('DISPOSE');
    super.dispose();
  }

  // Widget _showImage() {
  //   return  Container(
  //     width: 200,
  //     height: 200,
  //     decoration: const BoxDecoration(
  //         image: DecorationImage(
  //             image: ExactAssetImage('assets/images/readjust.jpg'),
  //             fit: BoxFit.cover)),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    user = context.select((AuthBloc bloc) => bloc.state.user);
    return SizedBox(
      height: 480,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
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
                              // const Text(
                              //   "Config:",
                              //   style: TextStyle(fontWeight: FontWeight.bold),
                              // ),
                              // Text('Total trials $_configMaxTrials'),
                              // Text(
                              //     'BodySelect after $_configStepBodySelect steps'),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // Text(
                              //   "Complete trial $_completeTrials of $_configMaxTrials",
                              //   style: const TextStyle(
                              //       fontWeight: FontWeight.bold),
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Estimated BPM",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              Text(
                                (_bpm > 30 && _bpm < 150
                                    ? _bpm.toString()
                                    : "--"),
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
                    child: Column(
                      children: [
                        Transform.scale(
                          scale: _iconScale,
                          child: _isFinished
                              ? ElevatedButton(
                                  onPressed: () => null,
                                  style: ElevatedButton.styleFrom(
                                    primary: theme.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text('Finished'),
                                )
                              : _toggled
                                  ? Text('$_start')
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: theme.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (_toggled) {
                                          _untoggle();
                                        } else {
                                          _toggle();
                                        }
                                      },
                                      child: const Text('START'),
                                    ),
                        ),
                      ],
                    ),
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
            // _bpm > 30 && _bpm < 150 ? Container() : _toggled ? Center(child: Image.asset('assets/images/readjust.png' )): Container(),
          ],
        ),
      ),
    );
  }

  // _calculateStep(int total, int range) {
  //   while (total >= _currentStep) {
  //     _currentStep += range;
  //     if (_currentStep <= total) {
  //       listSelectSteps.add(_currentStep);
  //     }
  //   }
  // }

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

      // after is toggled
      _initTimer();
      _countDown();
      _updateBPM();
      _startDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    });
  }

  void _untoggle() async {
    // final instantBPMs = _instantBPMs.map((e) => e.toString()).toList();
    // final instantPeriods = _instantPeriods.map((e) => e.toString()).toList();
    // final averagePeriods = _averagePeriods.map((e) => e.toString()).toList();
    // final instantErrs = _instantErrs.map((e) => e.toString()).toList();
    // final currentDelays = _currentDelays.map((e) => e.toString()).toList();
    // final knobScales = _knobScales.map((e) => e.toString()).toList();

    _disposeController();
    Wakelock.disable();
    _animationController!.stop();
    _animationController!.value = 0.0;
    if (_timerDuration != null) {
      _timerDuration!.cancel();
    }

    setState(() {
      // _prefs.then((SharedPreferences p) {
      //   _countTrials++;
      //   p.setInt('numRuns', _countTrials);
      //   p.setStringList('instantBPMs', instantBPMs);
      //   p.setStringList('instantPeriods', instantPeriods);
      //   p.setStringList('averagePeriods', averagePeriods);
      //   p.setStringList('instantErrs', instantErrs);
      //   p.setStringList('knobScales', knobScales);
      //   p.setStringList('currentDelays', currentDelays);
      //   // print(p.getInt("numRuns").toString());
      // });
      // _countTrials++;
      _toggled = false;
      _isFinished = true;
    });

    final baselineData = {
      "baselines": _instantBPMs,
      "startDate": _startDate,
      "endDate": DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())
    };

    users.doc(user.id).collection('baselines').add(baselineData);

    // _start = 30;
    _instantBPMs.clear();
    // _instantPeriods.clear();
    // _averagePeriods.clear();
    // _instantErrs.clear();
    // _currentDelays.clear();
    // _knobScales.clear();
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

  // _randomGen(min, max) {
  //   Random random = Random();
  //   double rand = random.nextDouble() * (random.nextBool() ? -1 : 1);
  //   return rand;
  // }

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
    // print(_avg.toString());
    if (_data.length >= _windowLen) {
      _data.removeAt(0);
    }
    setState(() {
      _data.add(SensorValue(_now!, 255 - _avg!));
      // print(_data);
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
      // print(_threshold);
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
        // print('BMP $_bpm');
        // double previousInstantPeriod = 0;
        // if (_instantPeriods.isNotEmpty) {
        //   previousInstantPeriod = _instantPeriods[_instantPeriods.length - 1];
        //   print("PREVIOUS  $previousInstantPeriod");
        // }

        _instantBPMs.add(_bpm);

        // final double instantPeriod = 60 / _bpm;
        // _instantPeriods.add(instantPeriod);
        // int count = _instantPeriods.length;
        // double sum = _instantPeriods.fold<double>(
        //     0, (double sum, double item) => sum + item);
        // double averagePeriod = sum / count;
        // _averagePeriods.add(averagePeriod);
        // double currentDelay = (averagePeriod / 2) * _currentKnobValue;
        // _currentDelays.add(currentDelay);
        // _knobScales.add(_currentKnobValue);

        // print("Instance  $instantPeriod");
        // print("Count $count");
        // print("Average $averagePeriod");
        // if (previousInstantPeriod != 0) {
        //   final instantErr = previousInstantPeriod - instantPeriod;
        //   _instantErrs.add(instantErr);
        //   print("Err  $instantErr");
        // }
        // print("Current Delay $currentDelay");
        // print("+++++++++++++++++++++++");

        setState(() {
          this._bpm = ((1 - _alpha) * this._bpm + _alpha * _bpm).toInt();
        });
      }
      await Future.delayed(
          Duration(milliseconds: 1000)); // wait for a new set of _data values
    }
  }
}

// class ImageDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         width: 50,
//         height: 50,
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: ExactAssetImage('assets/images/readjust.jpg'),
//                 fit: BoxFit.cover)),
//       ),
//     );
//   }
// }