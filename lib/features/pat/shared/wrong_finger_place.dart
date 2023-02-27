import 'package:Veris/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

class WrongFingerPlace extends StatelessWidget {
  final bool isNoFinger;

  const WrongFingerPlace({Key? key, this.isNoFinger = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isNoFinger
        ? Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      ImageConstant.imgHand,
                      width: 200.0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Readjust your grip',
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Please make sure your finger is gently covering your phone's camera and flash to continue.",
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
