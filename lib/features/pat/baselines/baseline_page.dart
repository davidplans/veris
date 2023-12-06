import 'dart:async';

import 'package:Veris/core/user/user.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/features/pat/baselines/baseline_helper_service.dart';
import 'package:Veris/features/pat/baselines/partials/estimated_bpm.dart';
import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:Veris/features/pat/shared/wrong_finger_place.dart';
import 'package:Veris/features/pat/view/finger_camera_text_page.dart';
import 'package:Veris/features/pat/services/image_processing.dart';
import 'package:flutter/material.dart';
import 'package:Veris/style/theme.dart';
import 'package:camera/camera.dart';
import 'package:Veris/features/pat/shared/chart.dart';
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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AnimationController? _animationController;
  CameraController? _cameraController;
  CameraImage? _currentImageFromStream; // store the last camera image

  bool _measurementInProgress = false;
  bool _measurementWasFinished = false;

  final List<SensorValue> _data = <SensorValue>[]; // array to store the values
  final List<double> _instantBPMs = <double>[];

  double _iconScale = 1;
  int _currentCounter = 60;

  int _bpm = 0; // beats per minute

  final int _fs = 30; // sampling frequency (fps)
  final int _windowLen = 30 * 6; // window length to display - 6 seconds

  Timer? _timer; // timer for image processing

  Timer? _timerDuration; // timer for duration

  late User user;
  bool _isNoFinger = false;

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
    _measurementInProgress = false;
    _disposeCameraController();
    Wakelock.disable();
    _animationController!.stop();
    _animationController!.dispose();
    super.dispose();
  }

  void _startMeasurements() async {
    _prepareCleanDataForGraph();
    await initCameraAndStartImageStream();
    Wakelock.enable();
    _animationController!.repeat(reverse: true);

    setState(() {
      _measurementInProgress = true;
    });

    // after is started
    _initTimer();
    _startCounterDown();
  }

  void _stopMeasurementsAndSaveData() async {
    _disposeCameraController();
    Wakelock.disable();

    _animationController!.stop();
    _animationController!.value = 0.0;

    if (_timerDuration != null) {
      _timerDuration!.cancel();
    }

    setState(() {
      _measurementInProgress = false;
      _measurementWasFinished = true;
      _isNoFinger = false;
    });

    BaselineHelper.storeDataToDB(
        user.id, studyId, moduleId, currentModuleResultId, _instantBPMs);

    _instantBPMs.clear();
  }

  void _disposeCameraController() {
    if (_cameraController != null) {
      _cameraController!.dispose();
    }
    _cameraController = null;
  }

  void _startCounterDown() {
    _timerDuration = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) {
        if (_currentCounter == 0) {
          setState(() {
            _measurementInProgress = false;
            _stopMeasurementsAndSaveData();
            t.cancel();
          });
        } else {
          setState(() {
            _currentCounter--;
          });
          _updateBPM();
        }
      },
    );
  }

  void _updateBPM() {
    final currentValues = BaselineHelper.calculateCurrentBMP(_data);
    if (currentValues.counter > 0) {
      final bpm = currentValues.bpm / currentValues.counter;
      const double alpha = 0.3; // factor for the mean value

      _instantBPMs.add(bpm);

      setState(() {
        _bpm = ((1 - alpha) * _bpm + alpha * bpm).toInt();
      });
    }
  }

  Future<void> initCameraAndStartImageStream() async {
    try {
      List cameras = await availableCameras();
      _cameraController = CameraController(cameras.first, ResolutionPreset.low);
      await _cameraController!.initialize();
      await Future.delayed(const Duration(milliseconds: 100));
      _cameraController!.setFlashMode(FlashMode.torch);
      _cameraController!.startImageStream((CameraImage image) {
        _currentImageFromStream = image;
      });
    } on Exception {
      debugPrint("Camera Error");
    }
  }

  void _initTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1000 ~/ _fs), (timer) {
      if (_measurementInProgress) {
        if (_currentImageFromStream != null) {
          _scanImage(_currentImageFromStream!);
        }
      } else {
        timer.cancel();
      }
    });
  }

  void _scanImage(CameraImage image) {
    _isNoFinger = !ImageProcessing.isAvailableFingerOnCamera(image);

    final DateTime now = DateTime.now();

    final avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;

    if (_data.length >= _windowLen) {
      _data.removeAt(0);
    }

    setState(() {
      _data.add(SensorValue(now, 255 - avg));
    });
  }

  void _prepareCleanDataForGraph() {
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

  @override
  Widget build(BuildContext context) {
    user = context.select((AuthBloc bloc) => bloc.state.user);

    return Stack(children: [
      Scaffold(
        appBar: const AppBarWidget(title: "Veris - Baselines"),
        floatingActionButton: _measurementWasFinished
            ? const SliderNavigation(
                nextPage: FingerCameraPage(),
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
                                      _cameraController != null &&
                                              _measurementInProgress
                                          ? AspectRatio(
                                              aspectRatio: _cameraController!
                                                  .value.aspectRatio,
                                              child: CameraPreview(
                                                  _cameraController!),
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
                                          _measurementInProgress
                                              ? "Cover both the camera and the flash with your finger"
                                              : "Camera feed will display here",
                                          style: TextStyle(
                                              backgroundColor:
                                                  _measurementInProgress
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
                              child: EstimatedBPM(bpm: _bpm),
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
                              child: _measurementInProgress
                                  ? Text('$_currentCounter')
                                  : _measurementWasFinished
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
                                            _startMeasurements();
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
                        // child: Chart(_data),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      WrongFingerPlace(isNoFinger: _isNoFinger)
    ]);
  }
}
