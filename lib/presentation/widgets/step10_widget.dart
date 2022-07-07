import 'package:flutter/material.dart';

class Step10Widget extends StatefulWidget {
  Step10Widget({Key? key}) : super(key: key);

  @override
  State<Step10Widget> createState() => _Step10WidgetState();
}

class _Step10WidgetState extends State<Step10Widget> {
  double _currentSliderValue = 5;

  _changeSlider(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "After you have matched the sound with your heartbeat, you will be asked how sure you are about the answer you gave.\n\nPress “confirm” then “Done” to start the following trial. In this task, there will be 20 trials in total.",
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(height: 20.0,),
        const Text(
          "How confident are you that the tone matched you heart-beat?",
          style: TextStyle(fontSize: 16.0),
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
