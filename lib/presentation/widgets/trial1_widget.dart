import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_schema_health/style/theme.dart';

class Trial1Widget extends StatefulWidget {
  Trial1Widget({Key? key}) : super(key: key);

  @override
  State<Trial1Widget> createState() => _Trial1WidgetState();
}

class _Trial1WidgetState extends State<Trial1Widget> {
  double finalAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text((finalAngle * 180 / pi).toStringAsFixed(0),
              style: const TextStyle(
                fontSize: 50,
              )),
          const SizedBox(height: 100),
          Container(
            width: 250,
            height: 250,
            color: Colors.white,
            child: LayoutBuilder(builder: (context, constraints) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanUpdate: (details) {
                  Offset centerOfGestureDetector = Offset(
                      constraints.maxWidth / 2, constraints.maxHeight / 2);
                  final touchPositionFromCenter =
                      details.localPosition - centerOfGestureDetector;
                  setState(
                    () {
                      finalAngle = touchPositionFromCenter.direction;
                    },
                  );
                },
                child: Transform.rotate(
                  angle: finalAngle,
                  child: const Image(
                    image: AssetImage("assets/images/knob.png"),
                  ),
                ),
              );
            }),
          ),
           const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Confirm',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
