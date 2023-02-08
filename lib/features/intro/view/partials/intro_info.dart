import 'package:Veris/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

class IntroInfo extends StatelessWidget {
  const IntroInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      Image.asset(
        ImageConstant.imgDarkCircle,
        width: 150,
        height: 150,
      ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        "Lets get started",
        style: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
      const SizedBox(
        height: 20,
      ),
      const SizedBox(
          width: 300,
          child: Text(
            "Welcome to VERIS - a platform to participate in research surveys directly from your smartphone.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
          ))
    ]);
  }
}
