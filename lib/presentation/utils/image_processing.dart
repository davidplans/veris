
import 'package:flutter/foundation.dart';

abstract class ImageProcessing {
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
  static double decodeYUV420SPtoRedBlueGreenAvg(
      Uint8List yuv420sp, int width, int height, int type) {
    if (yuv420sp == null) return 0;
    final int frameSize = width * height;

    int sum = _decodeYUV420SPtoRedBlueGreenSum(yuv420sp, width, height, type);

    return (sum / frameSize);
  }

  static convertYUV420toImageColor(int width, int height, int uvRowStride,
      int uvPixelStride, Uint8List yp, Uint8List up, Uint8List vp) async {
    try {
      // final int width = image.width;
      // final int height = image.height;
      // final int uvRowStride = image.planes[1].bytesPerRow;
      // final int? uvPixelStride = image.planes[1].bytesPerPixel;

      print("uvRowStride: " + uvRowStride.toString());
      print("uvPixelStride: " + uvPixelStride.toString());

      // imgLib -> Image package from https://pub.dartlang.org/packages/image
      // var img =
      //     imgLib.Image(width: width, height: height); // Create Image buffer

      // Fill image buffer with plane[0] from YUV420_888
      for (int x = 0; x < width; x++) {
        for (int y = 0; y < height; y++) {
          final int uvIndex =
              uvPixelStride * (x / 2).floor() + uvRowStride * (y / 2).floor();
          final int index = y * width + x;

          // final yp = image.planes[0].bytes[index];
          // final up = image.planes[1].bytes[uvIndex];
          // final vp = image.planes[2].bytes[uvIndex];
          // Calculate pixel color
          int r = (yp[index] + vp[uvIndex] * 1436 / 1024 - 179).round();
          int g = (yp[index] -
                  up[uvIndex] * 46549 / 131072 +
                  44 -
                  vp[uvIndex] * 93604 / 131072 +
                  91)
              .round();
          int b = (yp[index] + up[uvIndex] * 1814 / 1024 - 227).round();
          // color: 0x FF  FF  FF  FF
          //           A   B   G   R
          print('AVG $r');
          print('AVG2 $g');
          print('AVG3 $b');
          // img.data[index] = shift | (b << 16) | (g << 8) | r;
        }
      }

      // imglib.PngEncoder pngEncoder = new imglib.PngEncoder(level: 0, filter: 0);
      // List<int> png = pngEncoder.encodeImage(img);
      // muteYUVProcessing = false;
      // return Image.memory(png);
    } catch (e) {
      print(">>>>>>>>>>>> ERROR:" + e.toString());
    }
    return null;
  }

  static List<int> convertYUV420_NV21toRGB8888(
      Uint8List data, int width, int height) {
    int size = width * height;
    int offset = size;
    List<int> pixels = [size];
    int u, v, y1, y2, y3, y4;

    // i percorre os Y and the final pixels
    // k percorre os pixles U e V
    for (int i = 0, k = 0; i < size; i += 2, k += 2) {
      y1 = data[i] & 0xff;
      y2 = data[i + 1] & 0xff;
      y3 = data[width + i] & 0xff;
      y4 = data[width + i + 1] & 0xff;

      u = data[offset + k] & 0xff;
      v = data[offset + k + 1] & 0xff;
      u = u - 128;
      v = v - 128;

      pixels[i] = convertYUVtoRGB(y1, u, v);
      pixels[i + 1] = convertYUVtoRGB(y2, u, v);
      pixels[width + i] = convertYUVtoRGB(y3, u, v);
      pixels[width + i + 1] = convertYUVtoRGB(y4, u, v);

      if (i != 0 && (i + 2) % width == 0) i += width;
    }
    print("PIXEL $pixels");
    return pixels;
  }

  static int convertYUVtoRGB(int y, int u, int v) {
    int r, g, b;

    r = y + (1.402 * v).toInt();
    g = y - (0.344 * u + 0.714 * v).toInt();
    b = y + (1.772 * u).toInt();
    r = r > 255
        ? 255
        : r < 0
            ? 0
            : r;
    g = g > 255
        ? 255
        : g < 0
            ? 0
            : g;
    b = b > 255
        ? 255
        : b < 0
            ? 0
            : b;
    return 0xff000000 | (b << 16) | (g << 8) | r;
  }
}
