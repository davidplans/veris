import 'package:flutter/material.dart';

class Trial2Widget extends StatefulWidget {
  Trial2Widget({Key? key}) : super(key: key);

  @override
  State<Trial2Widget> createState() => _Trial2WidgetState();
}

class _Trial2WidgetState extends State<Trial2Widget> {
 double _currentSliderValue = 6;

  _changeSlider(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0,),
        const Text(
          "How confident are you that the tone matched you heart-beat?",
          style: TextStyle(fontSize: 20.0),
        ),
        Slider(
          value: _currentSliderValue,
          max: 10,
          divisions: 10,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            _changeSlider(value);
          },
        ),
        Row(children: const [
          Expanded(child: Text("Not at all \nconfident")),
          Expanded(child: Text("Extremely \nconfident", textAlign: TextAlign.end,)),
        ],)
      ],
    );
  }
}