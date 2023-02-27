import 'package:Veris/core/utils/image_constant.dart';
import 'package:flutter/material.dart';

class IntroTopBar extends StatelessWidget {
  const IntroTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 15, 32, 66),
      ),
      SizedBox(
          height: 70.0,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstant.imgBase,
                    width: 20,
                  ),
                  const Text(
                    "  VERIS",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )))
    ]);
  }
}
