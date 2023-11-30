import 'dart:typed_data';
import 'dart:io' show Platform;

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

List<int> averageRed = [];

abstract class ImageProcessing {
  static bool isAvailableFingerOnCamera(CameraImage image) {
    bool result = false;
    if (Platform.isAndroid) {
      int red = ImageProcessing.decodeYUV420ToRGB(image);
      if (red >= 200 && red <= 255) {
        result = true;
      }
    } else if (Platform.isIOS) {
      int h = image.height;
      int w = image.width;
      Uint8List bytes = image.planes.first.bytes;
      double redAVG = ImageProcessing.decodeBGRA8888toRGB(bytes, w, h, 1);
      if (redAVG > 90 && redAVG < 127.6) {
        result = true;
      }
      // print('redAVG $redAVG');
    }

    return result;
  }

  static int _decodeYUV420SPtoRedBlueGreenSum(
      Uint8List yuv420sp, int width, int height, int type) {
    if (yuv420sp == null) return 0;

    final int frameSize = width * height;
    int sum = 0;
    int sumr = 0;
    int sumg = 0;
    int sumb = 0;
    for (int j = 0, yp = 0; j < height; j++) {
      int uvp = frameSize + (j >> 1) * width, u = 0, v = 0;
      for (int i = 0; i < width; i++, yp++) {
        int y = (0xff & yuv420sp[yp]) - 16;
        if (y < 0) y = 0;
        if ((i & 1) == 0) {
          v = (0xff & yuv420sp[uvp++]) - 128;
          u = (0xff & yuv420sp[uvp++]) - 128;
        }
        int y1192 = 1192 * y;
        int r = (y1192 + 1634 * v);
        int g = (y1192 - 833 * v - 400 * u);
        int b = (y1192 + 2066 * u);

        if (r < 0)
          r = 0;
        else if (r > 262143) r = 262143;
        if (g < 0)
          g = 0;
        else if (g > 262143) g = 262143;
        if (b < 0)
          b = 0;
        else if (b > 262143) b = 262143;

        int pixel = 0xff000000 |
            ((r << 6) & 0xff0000) |
            ((g >> 2) & 0xff00) |
            ((b >> 10) & 0xff);
        int red = (pixel >> 16) & 0xff;
        int green = (pixel >> 8) & 0xff;
        int blue = pixel & 0xff;
        sumr += red;
        sumg += green;
        sumb += blue;
      }
    }
    switch (type) {
      case (1):
        sum = sumr;
        break;
      case (2):
        sum = sumb;
        break;
      case (3):
        sum = sumg;
        break;
    }
    return sum;
  }

  /**
     * Given a byte array representing a yuv420sp image, determine the average
     * amount of red in the image. Note: returns 0 if the byte array is NULL.
     *
     * @param yuv420sp Byte array representing a yuv420sp image
     * @param width    Width of the image.
     * @param height   Height of the image.
     * @return int representing the average amount of red in the image.
     */
  static double decodeBGRA8888toRGB(
      Uint8List yuv420sp, int width, int height, int type) {
    if (yuv420sp == null) return 0;
    final int frameSize = width * height;

    int sum = _decodeYUV420SPtoRedBlueGreenSum(yuv420sp, width, height, type);

    return (sum / frameSize);
  }

  static int decodeYUV420ToRGB(CameraImage cameraImage) {
    int red = 0;
    final width = cameraImage.width;
    final height = cameraImage.height;

    final yRowStride = cameraImage.planes[0].bytesPerRow;
    final uvRowStride = cameraImage.planes[1].bytesPerRow;
    final uvPixelStride = cameraImage.planes[1].bytesPerPixel!;

    // final image = image_lib.Image(width, height);

    for (var w = 0; w < width; w++) {
      for (var h = 0; h < height; h++) {
        final uvIndex =
            uvPixelStride * (w / 2).floor() + uvRowStride * (h / 2).floor();
        // final index = h * width + w;
        final yIndex = h * yRowStride + w;

        final y = cameraImage.planes[0].bytes[yIndex];
        final u = cameraImage.planes[1].bytes[uvIndex];
        final v = cameraImage.planes[2].bytes[uvIndex];

        red = yuv2rgb(y, u, v);
      }
    }
    return red;
  }

  static int yuv2rgb(int y, int u, int v) {
    var r = (y + v * 1436 / 1024 - 179).round();
    var g = (y - u * 46549 / 131072 + 44 - v * 93604 / 131072 + 91).round();
    var b = (y + u * 1814 / 1024 - 227).round();

    // Clipping RGB values to be inside boundaries [ 0 , 255 ]
    r = r.clamp(0, 255);
    g = g.clamp(0, 255);
    b = b.clamp(0, 255);

    return r;
  }
}
