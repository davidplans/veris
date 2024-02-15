import 'package:Veris/features/pat/models/sensor.dart';
import 'package:Veris/features/pat/services/get_preferred_camera.dart';
import 'package:Veris/features/pat/services/image_processing.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HeartBPM extends StatefulWidget {
  final void Function(int) onBPM;
  final void Function(bool) onFingerPresentChanged;
  final int sampleDelay;
  final BuildContext context;

  /// Smoothing factor
  ///
  /// Factor used to compute exponential moving average of the realtime data
  /// using the formula:
  /// ```
  /// $y_n = alpha * x_n + (1 - alpha) * y_{n-1}$
  /// ```
  final double alpha;

  const HeartBPM({
    super.key,
    required this.context,
    this.sampleDelay = 2000 ~/ 30,
    required this.onBPM,
    required this.onFingerPresentChanged,
    this.alpha = 0.8,
  });

  @override
  State<HeartBPM> createState() => _HeartBPMState();
}

class _HeartBPMState extends State<HeartBPM> {
  /// Camera controller
  CameraController? _controller;

  /// Used to set sampling rate
  bool _processing = false;

  /// Current value
  int currentValue = 0;

  double _max = 0;

  int _counter = 0;

  /// to ensure camara was initialized
  bool isCameraInitialized = false;

  bool _isNoFinger = false;

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

  void _deinitController() async {
    isCameraInitialized = false;
    if (_controller == null) return;
    await _controller!.dispose();
  }

  Future<void> _initController() async {
    if (_controller != null) return;
    try {
      var preferredCamera = await getPreferredCamera();
      _controller = CameraController(preferredCamera, ResolutionPreset.low,
          enableAudio: false);

      await _controller!.initialize();

      Future.delayed(const Duration(milliseconds: 500))
          .then((value) => _controller!.setFlashMode(FlashMode.torch));

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
      rethrow;
    }
  }

  static const int windowLength = 50;
  final List<SensorValue> measureWindow = List<SensorValue>.filled(
      windowLength, SensorValue(time: DateTime.now(), value: 0),
      growable: true);

  void _scanImage(CameraImage image) async {
    _isNoFinger = !ImageProcessing.isAvailableFingerOnCamera(image);
    double avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;

    measureWindow.removeAt(0);
    measureWindow.add(SensorValue(time: DateTime.now(), value: avg));

    widget.onFingerPresentChanged(_isNoFinger);

    _smoothBPM(avg).then((_) {
      Future<void>.delayed(Duration(milliseconds: widget.sampleDelay))
          .then((_) {
        if (mounted) {
          setState(() {
            _processing = false;
          });
        }
      });
    });
  }

  /// Smooth the raw measurements using Exponential averaging
  /// the scaling factor [alpha] is used to compute exponential moving average of the
  /// realtime data using the formula:
  /// ```
  /// $y_n = alpha * x_n + (1 - alpha) * y_{n-1}$
  /// ```
  Future<int> _smoothBPM(double newAvg) async {
    double maxVal = 0, avg = 0;

    for (var element in measureWindow) {
      avg += element.value / measureWindow.length;
      if (element.value > maxVal) maxVal = element.value as double;
    }

    double threshold = (maxVal + avg) / 2;
    int counter = 0, previousTimestamp = 0;
    double tempBPM = 0;
    for (int i = 1; i < measureWindow.length; i++) {
      // find rising edge
      if (measureWindow[i - 1].value < threshold &&
          measureWindow[i].value > threshold) {
        if (previousTimestamp != 0) {
          counter++;
          tempBPM += 60000 /
              (measureWindow[i].time.millisecondsSinceEpoch -
                  previousTimestamp); // convert to per minute
        }
        previousTimestamp = measureWindow[i].time.millisecondsSinceEpoch;
      }
    }

    if (counter > 0) {
      tempBPM /= counter;
      tempBPM = (1 - widget.alpha) * currentValue + widget.alpha * tempBPM;
      setState(() {
        currentValue = tempBPM.toInt();
      });

      if (newAvg > _max) {
        _max = newAvg;
        _counter++;
        if (_counter >= 6) {
          _counter = 0;
          widget.onBPM(currentValue);
        }
      } else {
        _max = 0;
        _counter = 0;
      }
    }
    return currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isCameraInitialized
          ? Column(
              children: [
                Container(
                  constraints: const BoxConstraints.tightFor(
                    width: 100,
                    height: 130,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: _controller!.buildPreview(),
                  ),
                ),
                // Text(currentValue.toStringAsFixed(0)),
              ],
            )
          : const CircularProgressIndicator(),
    );
  }
}
