import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BeatsSlider extends StatefulWidget {
  const BeatsSlider({Key? key}) : super(key: key);

  @override
  State<BeatsSlider> createState() => _BeatsSliderState();
}

class _BeatsSliderState extends State<BeatsSlider> {
  double _currentSliderValue = 60;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 200,
      // divisions: 1,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
