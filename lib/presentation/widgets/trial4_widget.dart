import 'package:flutter/material.dart';

class Trial4Widget extends StatefulWidget {
  Trial4Widget({Key? key}) : super(key: key);

  @override
  State<Trial4Widget> createState() => _Trial4WidgetState();
}

class _Trial4WidgetState extends State<Trial4Widget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      Text(
          "In the last run, where did you feel your heart-beat? Tap on the drawing below to identify the relevant area."),
      Image(image: AssetImage("assets/images/mannequin2.png"), height: 300,),
      Text("Please select an area")
    ]);
  }
}
