import 'dart:io';

import 'package:camera/camera.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<CameraDescription> getPreferredCamera() async {
  Map<String, CameraDescription> cameraTypes = await _identifyCameraTypes();
  if (Platform.isAndroid) {
    return cameraTypes.values.first;
  }

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
  String model = iosDeviceInfo.model ?? 'unknown';

  if (model == 'unknown') {
    return cameraTypes.values.first;
  }

  String? preferredLens = _preferredLenses[model];
  return cameraTypes[preferredLens ?? 'unknown'] ?? cameraTypes.values.first;
}

final Map<String, String?> _preferredLenses = {
  // iPhone models with telephoto camera:
  'iPhone9,2': 'telephoto',
  'iPhone9,4': 'telephoto',
  'iPhone10,2': 'telephoto',
  'iPhone10,5': 'telephoto',
  'iPhone10,3': 'telephoto',
  'iPhone10,6': 'telephoto',
  'iPhone11,2': 'telephoto',
  'iPhone11,4': 'telephoto',
  'iPhone11,6': 'telephoto',

  // iPhone 12 and later:
  'iPhone12,1': 'ultrawide',
  'iPhone12,3': 'ultrawide',
  'iPhone12,5': 'ultrawide',

  // iPhone 13 and later (wide angle as preferred):
  'iPhone13,2': 'rear',
  'iPhone13,1': 'rear',
  'iPhone13,3': 'ultrawide',
  'iPhone13,4': 'ultrawide',

  // iPhone 14 and later (wide angle as preferred):
  'iPhone14,5': 'rear',
  'iPhone14,4': 'rear',
  'iPhone14,2': 'ultrawide',
  'iPhone14,3': 'ultrawide',
  'iPhone14,7': 'rear',
  'iPhone14,8': 'rear',

  // iPhone 15 and later (no data yet):
  'iPhone15,2': null,
  'iPhone15,3': null,
};

Future<Map<String, CameraDescription>> _identifyCameraTypes() async {
  List<CameraDescription> cameras = await availableCameras();
  Map<String, CameraDescription> cameraTypes = {};

  for (CameraDescription camera in cameras) {
    String cameraType = 'unknown';

    if (camera.lensDirection == CameraLensDirection.back) {
      if (camera.sensorOrientation == 90) {
        cameraType = 'rear';
      } else if (camera.sensorOrientation == 270) {
        cameraType = 'telephoto';
      } else if (camera.sensorOrientation == 0) {
        cameraType = 'ultrawide';
      }
    }

    cameraTypes[cameraType] = camera;
  }

  return cameraTypes;
}
