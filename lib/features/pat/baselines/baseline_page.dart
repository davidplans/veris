import 'dart:async';

import 'package:Veris/core/user/user.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:Veris/features/pat/shared/wrong_finger_place.dart';
import 'package:Veris/features/pat/view/finger_camera_text_page.dart';
import 'package:Veris/utils/image_processing.dart';
import 'package:flutter/material.dart';
import 'package:Veris/style/theme.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Veris/utils/chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Veris/common/widgets/app_bar_widget.dart';

class BaselinePage extends StatefulWidget {
  const BaselinePage({super.key});

  @override
  State<BaselinePage> createState() => _BaselinePageState();
}

class _BaselinePageState extends State<BaselinePage>
    with SingleTickerProviderStateMixin {
  bool _toggled = false; // toggle button value
  final List<SensorValue> _data = <SensorValue>[]; // array to store the values
  final List<double> _instantBPMs = <double>[];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  CameraController? _controller;
  final double _alpha = 0.3; // factor for the mean value
  AnimationController? _animationController;
  double _iconScale = 1;
  int _bpm = 0; // beats per minute
  final int _fs = 30; // sampling frequency (fps)
  final int _windowLen = 30 * 6; // window length to display - 6 seconds
  CameraImage? _image; // store the last camera image
  double? _avg; // store the average value during calculation
  DateTime? _now; // store the now Datetime
  Timer? _timer; // timer for image processing
  int _start = 60;
  Timer? _timerDuration; // timer for duration
  bool _isFinished = false;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late User user;
  bool _isFingerOverlay = false;

  String studyId = "";
  String currentModuleResultId = "";
  int moduleId = 0;

  @override
  initState() {
    _prefs.then((SharedPreferences p) {
      currentModuleResultId = p.getString('currentModuleResultId') ?? "";
      moduleId = p.getInt('moduleId') ?? 0;
      studyId = p.getString('studyId') ?? "";
    });

    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animationController!.addListener(() {
      setState(() {
        _iconScale = 1.0 + _animationController!.value * 0.4;
      });
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

  void _clearData() {
    // create array of 128 ~= 255/2
    _data.clear();
    int now = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < _windowLen; i++) {
      _data.insert(
          0,
          SensorValue(
              DateTime.fromMillisecondsSinceEpoch(now - i * 1000 ~/ _fs), 128));
    }
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
    });
  }

  void _untoggle() async {
    _disposeController();
    Wakelock.disable();
    _animationController!.stop();
    _animationController!.value = 0.0;
    if (_timerDuration != null) {
      _timerDuration!.cancel();
    }

    setState(() {
      _toggled = false;
      _isFinished = true;
      _isFingerOverlay = false;
    });

    final baseStudyModuleData = {
      "userId": user.id,
      "studyId": studyId,
      "moduleId": moduleId,
      "sectionId": 'none',
      "sectionName": 'none',
      "moduleName": 'none',
      "datetime": DateTime.now(),
      "type": "pat",
      "baselines": _instantBPMs
    };

    users
        .doc(user.id)
        .collection('studies')
        .doc(currentModuleResultId)
        .set(baseStudyModuleData);
    _instantBPMs.clear();
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
      List cameras = await availableCameras();
      _controller = CameraController(cameras.first, ResolutionPreset.low);
      await _controller!.initialize();
      Future.delayed(const Duration(milliseconds: 100)).then((onValue) {
        _controller!.setFlashMode(FlashMode.torch);
      });
      _controller!.startImageStream((CameraImage image) {
        _image = image;
      });
    } on Exception {
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
    _isFingerOverlay = ImageProcessing.decodeImageFromCamera(image);

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
    // Bear in mind that the method used to calculate the BPM is very rudimentary
    // feel free to improve it :)

    // Since this function doesn't need to be so "exact" regarding the time it executes,
    // I only used the a Future.delay to repeat it from time to time.
    // Ofc you can also use a Timer object to time the callback of this function
    List<SensorValue> values;
    double avg;
    int n;
    double m;
    double threshold;
    double bpm;
    int counter;
    int previous;

    while (_toggled) {
      values = List.from(_data); // create a copy of the current data array
      avg = 0;
      n = values.length;
      m = 0;
      for (var value in values) {
        avg += value.value / n;
        if (value.value > m) m = value.value;
      }
      threshold = (m + avg) / 2;
      bpm = 0;
      counter = 0;
      previous = 0;
      for (int i = 1; i < n; i++) {
        if (values[i - 1].value < threshold && values[i].value > threshold) {
          if (previous != 0) {
            counter++;
            bpm +=
                60 * 1000 / (values[i].time.millisecondsSinceEpoch - previous);
          }
          previous = values[i].time.millisecondsSinceEpoch;
        }
      }
      if (counter > 0) {
        bpm = bpm / counter;

        _instantBPMs.add(bpm);

        setState(() {
          _bpm = ((1 - _alpha) * _bpm + _alpha * bpm).toInt();
        });
      }
      await Future.delayed(const Duration(
          milliseconds: 1000)); // wait for a new set of _data values
    }
  }

  @override
  Widget build(BuildContext context) {
    user = context.select((AuthBloc bloc) => bloc.state.user);

    return Stack(children: [
      Scaffold(
        appBar: AppBarWidget(title: "Veris - Baselines"),
        floatingActionButton: _isFinished
            ? const SliderNavigation(
                nexPage: FingerCameraPage(),
                nextButtonName: 'Continue',
                isNeedHideBackButton: true,
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SizedBox(
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
                                              aspectRatio: _controller!
                                                  .value.aspectRatio,
                                              child:
                                                  CameraPreview(_controller!),
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Estimated BPM",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                  Text(
                                    (_bpm > 30 && _bpm < 150
                                        ? _bpm.toString()
                                        : "--"),
                                    style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
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
                              child: _toggled
                                  ? Text('$_start')
                                  : _isFinished
                                      ? Container()
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: theme.primaryColor,
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
              ],
            ),
          ),
        ),
      ),
      WrongFingerPlace(isFingerOverlay: _isFingerOverlay)
    ]);
  }
}
