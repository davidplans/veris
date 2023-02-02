import 'dart:async';
import 'dart:math' as math;

import 'package:Veris/features/pat/shared/wrong_finger_place.dart';
import 'package:Veris/utils/image_processing.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'practice1_slider_page.dart';

class Practice1Page extends StatefulWidget {
  const Practice1Page({super.key});

  @override
  State<Practice1Page> createState() => _Practice1PageState();
}

class _Practice1PageState extends State<Practice1Page> {
  // ########## BPM VARs #############

  /// Camera controller
  CameraController? _controller;

  /// Used to set sampling rate
  bool _processing = false;

  /// Current value
  int currentValue = 0;

  /// to ensure camara was initialized
  bool isCameraInitialized = false;

  double _max = 0;

  List<double> _instantBPMs = <double>[];

  Timer? _timer;

  int _counter = 0;

  final _player = AudioPlayer();

  int sampleDelay = 2000 ~/ 30;

  double alpha = 0.8;

  bool _isFinished = false;

  bool _isFingerOverlay = false;

  double finalAngle = 0.0;

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
  }

  @override
  void dispose() {
    _deinitController();

    super.dispose();
  }

  /// Deinitialize the camera controller
  void _deinitController() async {
    _player.dispose();
    _isFinished = true;
    isCameraInitialized = false;
    if (_controller == null) return;
    // await _controller.stopImageStream();
    await _controller!.dispose();
    // while (_processing) {}
    // _controller = null;
    if (_timer != null) _timer?.cancel();
    _isFingerOverlay = false;
  }

  /// Initialize the camera controller
  ///
  /// Function to initialize the camera controller and start data collection.
  Future<void> _initController() async {
    _player.setLoopMode(LoopMode.off);

    if (_controller != null) return;
    try {
      // 1. get list of all available cameras
      List<CameraDescription> _cameras = await availableCameras();
      // 2. assign the preferred camera with low resolution and disable audio
      _controller = CameraController(_cameras.first, ResolutionPreset.low,
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
        isCameraInitialized = true;
      });
    } catch (e) {
      print(e);
      throw e;
    }

    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      if (_instantBPMs != null && _instantBPMs.isNotEmpty) {
        // print(_instantBPMs.toString());
        // print(_instantBPMs.reduce((a,b) => a + b) / _instantBPMs.length);
        _instantBPMs.clear();
      }
    });
  }

  _randomGen(min, max) {
    math.Random random = math.Random();
    double rand = random.nextDouble() * (random.nextBool() ? -1 : 1);
    return rand;
  }

  static const int windowLength = 50;
  final List<SensorValue> measureWindow = List<SensorValue>.filled(
      windowLength, SensorValue(time: DateTime.now(), value: 0),
      growable: true);

  void _scanImage(CameraImage image) {
    _isFingerOverlay = ImageProcessing.decodeImageFromCamera(image);

    // get the average value of the image
    double _avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;
    if (_avg > _max) {
      _max = _avg;
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
    measureWindow.add(SensorValue(time: DateTime.now(), value: _avg));

    _smoothBPM(_avg).then((value) {
      Future<void>.delayed(Duration(milliseconds: sampleDelay)).then((onValue) {
        if (mounted) {
          setState(() {
            _processing = false;
          });
        }
      });
    });
  }

  _mainCalculate() {
    print('NORM1 $_currentKnobValue');
    print('NORM2 $_range');

    _normalisedValue = (_currentKnobValue + _range) / (2 * _range);
    print('NORM3 $_normalisedValue');
    _shiftedRad = _normalisedValue * (2 * math.pi);
    print('shiftedRad $_shiftedRad');
    _rad = (_shiftedRad - math.pi);
    print('rad $_rad');

    if (_currentKnobValue == 0) {
      _currentKnobValue = _randomGen(-1, 1);
      print('RANDOM $_currentKnobValue');
    }
  }

  /// Smooth the raw measurements using Exponential averaging
  /// the scaling factor [alpha] is used to compute exponential moving average of the
  /// realtime data using the formula:
  /// ```
  /// $y_n = alpha * x_n + (1 - alpha) * y_{n-1}$
  /// ```
  Future<int> _smoothBPM(double newValue) async {
    double maxVal = 0, _avg = 0;

    measureWindow.forEach((element) {
      _avg += element.value / measureWindow.length;
      if (element.value > maxVal) maxVal = element.value as double;
    });

    double _threshold = (maxVal + _avg) / 2;
    int _counter = 0, previousTimestamp = 0;
    double _tempBPM = 0;
    for (int i = 1; i < measureWindow.length; i++) {
      // find rising edge
      if (measureWindow[i - 1].value < _threshold &&
          measureWindow[i].value > _threshold) {
        if (previousTimestamp != 0) {
          _counter++;
          _tempBPM += 60000 /
              (measureWindow[i].time.millisecondsSinceEpoch -
                  previousTimestamp); // convert to per minute
        }
        previousTimestamp = measureWindow[i].time.millisecondsSinceEpoch;
      }
    }

    if (_counter > 0) {
      _tempBPM /= _counter;

      _tempBPM = (1 - alpha) * currentValue + alpha * _tempBPM;
      _instantBPMs.add(_tempBPM);

      setState(() {
        currentValue = _tempBPM.toInt();
        // _bpm = _tempBPM;
      });
    }

    // double newOut = widget.alpha * newValue + (1 - widget.alpha) * _pastBPM;
    // _pastBPM = newOut;
    return currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBarWidget(title: "Veris - PRACTICE TRIAL 1"),
        body: Container(
            child: isCameraInitialized
                ? Column(
                    children: [
                      Container(
                        constraints:
                            BoxConstraints.tightFor(width: 100, height: 130),
                        child: _controller!.buildPreview(),
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
                            textStyle: TextStyle(color: Colors.white),
                          ),
                          child: const Text("Confirm"),
                          onPressed: () => setState(() {
                            _deinitController();
                          }),
                        ),
                      )
                      // _isFinished
                      //     ? Center(
                      //         child: ElevatedButton.icon(
                      //             icon: const Icon(Icons.favorite_rounded),
                      //             label: const Text("Continue"),
                      //             onPressed: () {}),
                      //       )
                      //     : Center(
                      //         child: ElevatedButton.icon(
                      //           icon: const Icon(Icons.favorite_rounded),
                      //           label: const Text("Confirm"),
                      //           onPressed: () => setState(() {
                      //             _deinitController();

                      //           }),
                      //         ),
                      //       )
                    ],
                  )
                : const Center(child: CircularProgressIndicator())),
      ),
      WrongFingerPlace(isFingerOverlay: _isFingerOverlay),
      _isFinished
          ? Scaffold(
              appBar: AppBarWidget(title: "Veris - PRACTICE TRIAL 1"),
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
                            textStyle: TextStyle(color: Colors.white),
                          ),
                          child: const Text("Continue"),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const Practice1SliderPage(),
                              ),
                            );
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

/// Class to store one sample data point
class SensorValue {
  /// timestamp of datapoint
  final DateTime time;

  /// value of datapoint
  final num value;

  SensorValue({required this.time, required this.value});

  /// Returns JSON mapped data point
  Map<String, dynamic> toJSON() => {'time': time, 'value': value};

  /// Map a list of data samples to a JSON formatted array.
  ///
  /// Map a list of [data] samples to a JSON formatted array. This is
  /// particularly useful to store [data] to database.
  static List<Map<String, dynamic>> toJSONArray(List<SensorValue> data) =>
      List.generate(data.length, (index) => data[index].toJSON());
}
