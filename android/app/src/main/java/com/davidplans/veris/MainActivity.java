package com.davidplans.veris;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
private static final String CHANNEL = "com.davidplans.veris.convertor";

@Override
public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
super.configureFlutterEngine(flutterEngine);
  new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
      .setMethodCallHandler(
        (call, result) -> {
            if(call.method.equals("rgbConvertor")){
            byte[] yuv420 = call.argument("bytes");
            int w = call.argument("w");
            int h = call.argument("h");
            // int type = call.argument("type");  
            //   int rgb = (int) decodeYUV420SPtoRedBlueGreenAvg(yuv420, w, h, type);
              int[] rgb =  convertYUV420_NV21toRGB8888(yuv420,w,h);
              result.success(rgb);
              // result.success("SACCESS");
            }
          // This method is invoked on the main thread.
          // TODO
        }
      );
}

public static int[] convertYUV420_NV21toRGB8888(byte [] data, int width, int height) {
    int size = width*height;
    int offset = size;
    int[] pixels = new int[size];
    int u, v, y1, y2, y3, y4;

    // i percorre os Y and the final pixels
    // k percorre os pixles U e V
    for(int i=0, k=0; i < size; i+=2, k+=2) {
        y1 = data[i  ]&0xff;
        y2 = data[i+1]&0xff;
        y3 = data[width+i  ]&0xff;
        y4 = data[width+i+1]&0xff;

        u = data[offset+k  ]&0xff;
        v = data[offset+k+1]&0xff;
        u = u-128;
        v = v-128;

        pixels[i  ] = convertYUVtoRGB(y1, u, v);
        pixels[i+1] = convertYUVtoRGB(y2, u, v);
        pixels[width+i  ] = convertYUVtoRGB(y3, u, v);
        pixels[width+i+1] = convertYUVtoRGB(y4, u, v);

        if (i!=0 && (i+2)%width==0)
            i+=width;
    }

    return pixels;
}

private static int convertYUVtoRGB(int y, int u, int v) {
    int r,g,b;

    r = y + (int)(1.402f*v);
    g = y - (int)(0.344f*u +0.714f*v);
    b = y + (int)(1.772f*u);
    r = r>255? 255 : r<0 ? 0 : r;
    g = g>255? 255 : g<0 ? 0 : g;
    b = b>255? 255 : b<0 ? 0 : b;
    int rgb = 0xff000000 | (b<<16) | (g<<8) | r;
    System.out.println("RGB " + rgb);
    return rgb;
}

// public int decode(int w, int h){
//     // int frameHeight1 = camera.getParameters().getPreviewSize().height;
//     // int frameWidth1 = camera.getParameters().getPreviewSize().width;
//     int rgb1[] = new int[w * h];
//     decodeYUV420SP(rgb1, data, w, h);
//     Bitmap bmp1 = Bitmap.createBitmap(rgb, frameWidth1, frameHeight1, Config.ARGB_8888);
//     int pixel = bmp1.getPixel( x,y );
//     int redValue1 = Color.red(pixel);
//     int blueValue1 = Color.blue(pixel);
//     int greenValue1 = Color.green(pixel);
//     int thiscolor1 = Color.rgb(redValue1, greenValue1, blueValue1);
//     return thiscolor1;
// }

    // private static int decodeYUV420SPtoRedBlueGreenSum(byte[] yuv420sp, int width, int height, int type) {
    //     if (yuv420sp == null) return 0;
    //     System.out.println("Convertor");
    //     final int frameSize = width * height;

    //     int sum = 0;
    //     int sumr = 0;
    //     int sumg = 0;
    //     int sumb = 0;
    //     for (int j = 0, yp = 0; j < height; j++) {
    //         int uvp = frameSize + (j >> 1) * width, u = 0, v = 0;
    //         for (int i = 0; i < width; i++, yp++) {
    //             int y = (0xff & yuv420sp[yp]) - 16;
    //             if (y < 0) y = 0;
    //             if ((i & 1) == 0) {
    //                 v = (0xff & yuv420sp[uvp++]) - 128;
    //                 u = (0xff & yuv420sp[uvp++]) - 128;
    //             }
    //             int y1192 = 1192 * y;
    //             int r = (y1192 + 1634 * v);
    //             int g = (y1192 - 833 * v - 400 * u);
    //             int b = (y1192 + 2066 * u);

    //             if (r < 0) r = 0;
    //             else if (r > 262143) r = 262143;
    //             if (g < 0) g = 0;
    //             else if (g > 262143) g = 262143;
    //             if (b < 0) b = 0;
    //             else if (b > 262143) b = 262143;

    //             int pixel = 0xff000000 | ((r << 6) & 0xff0000) | ((g >> 2) & 0xff00) | ((b >> 10) & 0xff);
    //             int red = (pixel >> 16) & 0xff;
    //             int green = (pixel >> 8) & 0xff;
    //             int blue = pixel & 0xff;
    //             sumr += red;
    //             sumg += green;
    //             sumb += blue;
    //         }
    //     }
    //     switch (type) {
    //         case (1):
    //             sum = sumr;
    //             break;
    //         case (2):
    //             sum = sumb;
    //             break;
    //         case (3):
    //             sum = sumg;
    //             break;
    //     }
    //     return sum;
    // }

    // /**
    //  * Given a byte array representing a yuv420sp image, determine the average
    //  * amount of red in the image. Note: returns 0 if the byte array is NULL.
    //  *
    //  * @param yuv420sp Byte array representing a yuv420sp image
    //  * @param width    Width of the image.
    //  * @param height   Height of the image.
    //  * @return int representing the average amount of red in the image.
    //  */
    // static double decodeYUV420SPtoRedBlueGreenAvg(byte[] yuv420sp, int width, int height, int type) {
    //     if (yuv420sp == null) return 0;
    //     final int frameSize = width * height;

    //     int sum = decodeYUV420SPtoRedBlueGreenSum(yuv420sp, width, height, type);

    //     return (sum / frameSize);
    // }
}
