import 'package:Veris/presentation/pages/home_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_ml_kit/google_ml_kit.dart';

import '../../data/models/face_model.dart';

class SmilePage extends StatefulWidget {
  const SmilePage({super.key});

  @override
  State<SmilePage> createState() => _SmilePageState();
}

class _SmilePageState extends State<SmilePage> {
  final _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My Emotion'),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => const HomePage()));
        },
        child: const Icon(Icons.home),
      ),
      body: GetBuilder<HomeController>(
        init: _homeController,
        initState: (_) async {
          await _homeController.loadCamera();
          _homeController.startImageStream();
        },
        builder: (_) {
          return Container(
            alignment: Alignment.center,
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: _.cameraController != null &&
                    _.cameraController!.value.isInitialized
                ? Stack(children: [
                    CameraPreview(_.cameraController!),
                    Center(
                      child: Text(
                        '${_.label}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ])
                : Center(child: Text('loading')),
            // SizedBox(height: 15),
            // Expanded(
            //   child: Container(
            //     alignment: Alignment.topCenter,
            //     width: 200,
            //     height: 200,
            //     color: Colors.white,
            //     child: Image.asset(
            //       'images/${_.faceAtMoment}',
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),

            // SizedBox(height: 10),
          );
        },
      ),
    );
  }
}

class HomeController extends GetxController {
  CameraManager? _cameraManager;
  CameraController? cameraController;
  FaceDetetorController? _faceDetect;
  bool _isDetecting = false;
  List<FaceModel>? faces;
  // String? faceAtMoment = 'normal_face.png';
  String? label = 'Normal';

  HomeController() {
    _cameraManager = CameraManager();
    _faceDetect = FaceDetetorController();
  }

  Future<void> loadCamera() async {
    cameraController = await _cameraManager?.load();
    update();
  }

  Future<void> startImageStream() async {
    CameraDescription camera = cameraController!.description;

    cameraController?.startImageStream((cameraImage) async {
      if (_isDetecting) return;

      _isDetecting = true;

      final WriteBuffer allBytes = WriteBuffer();
      for (Plane plane in cameraImage.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      final bytes = allBytes.done().buffer.asUint8List();

      final Size imageSize =
          Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

      final InputImageRotation imageRotation =
          rotationIntToImageRotation(camera.sensorOrientation);
      // InputImageRotation.fromRawValue(camera.sensorOrientation) ??
      //     InputImageRotation.rotation0deg;

      final InputImageFormat inputImageFormat =
          formatIntToImageFormat(cameraImage.format.raw);
      // InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ??
      // InputImageFormat.nv21;

      final planeData = cameraImage.planes.map(
        (Plane plane) {
          return InputImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList();

      final inputImageData = InputImageData(
        size: imageSize,
        imageRotation: imageRotation,
        inputImageFormat: inputImageFormat,
        planeData: planeData,
      );

      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        inputImageData: inputImageData,
      );

      processImage(inputImage);
    });
  }

  InputImageRotation rotationIntToImageRotation(int rotation) {
    switch (rotation) {
      case 90:
        return InputImageRotation.rotation90deg;
      case 180:
        return InputImageRotation.rotation180deg;
      case 270:
        return InputImageRotation.rotation270deg;
      default:
        return InputImageRotation.rotation0deg;
    }
  }

  InputImageFormat formatIntToImageFormat(int format) {
    switch (format) {
      case 842094169:
        return InputImageFormat.yv12;
      case 35:
        return InputImageFormat.yuv_420_888;
      case 875704438:
        return InputImageFormat.yuv420;
      case 1111970369:
        return InputImageFormat.bgra8888;
      default:
        return InputImageFormat.nv21;
    }
  }

  Future<void> processImage(inputImage) async {
    faces = await _faceDetect?.processImage(inputImage);

    if (faces != null && faces!.isNotEmpty) {
      FaceModel? face = faces?.first;
      label = detectSmile(face?.smile);
    } else {
      // faceAtMoment = 'normal_face.png';
      label = 'Not face detected';
    }
    _isDetecting = false;
    update();
  }

  String detectSmile(smileProb) {
    if (smileProb > 0.86) {
      // faceAtMoment = 'happy_face.png';
      return 'Big smile with teeth';
    } else if (smileProb > 0.6) {
      // faceAtMoment = 'happy_face.png';
      return 'Big Smile';
    } else if (smileProb > 0.3) {
      // faceAtMoment = 'happy_face.png';
      return 'Smile';
    } else {
      // faceAtMoment = 'sady_face.png';
      return 'Sad';
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}

class CameraManager {
  List<CameraDescription>? cameras;
  CameraController? _controller;

  Future<CameraController?> load() async {
    cameras = await availableCameras();
    //Set front camera if available or back if not available
    int position = cameras!.length > 0 ? 1 : 0;
    _controller = CameraController(
      cameras![position],
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await _controller?.initialize();
    return _controller;
  }

  CameraController? get controller => _controller;
}

class FaceDetetorController {
  FaceDetector? _faceDetector;

  Future<List<FaceModel>?> processImage(inputImage) async {
    _faceDetector = GoogleMlKit.vision.faceDetector(
      FaceDetectorOptions(
        enableClassification: true,
        enableLandmarks: true,
      ),
    );

    final faces = await _faceDetector?.processImage(inputImage);
    return extractFaceInfo(faces);
  }

  List<FaceModel>? extractFaceInfo(List<Face>? faces) {
    List<FaceModel>? response = [];
    double? smile;
    double? leftYears;
    double? rightYears;

    for (Face face in faces!) {
      final rect = face.boundingBox;
      if (face.smilingProbability != null) {
        smile = face.smilingProbability;
      }

      leftYears = face.leftEyeOpenProbability;
      rightYears = face.rightEyeOpenProbability;

      final faceModel = FaceModel(
        smile: smile,
        leftYearsOpen: leftYears,
        rightYearsOpen: rightYears,
      );

      response.add(faceModel);
    }

    return response;
  }
}
