import 'package:flutter/material.dart';

import 'app_bar_widget.dart';
import 'widget_v37.dart';

class V36Widget extends StatefulWidget {
  const V36Widget({super.key});

  @override
  State<V36Widget> createState() => _V36WidgetState();
}

class _V36WidgetState extends State<V36Widget> {

    double _currentSliderValue = 5;

  _changeSlider(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Veris"),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: FloatingActionButton.extended(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                backgroundColor: const Color(0XFF0F2042),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                label: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 1,
              child: FloatingActionButton.extended(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                backgroundColor: const Color(0XFF0F2042),
                onPressed: () {
                                      Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const V37Widget(),
                    ),
                  );
                },
                label: const Text(
                  "Done",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        children: [
          const SizedBox(height: 50,),
          const Text(
            "After you have matched the sound with your heartbeat, you will be asked how sure you are about the answer you gave.\n\nPress “confirm” then “Done” to start the following trial. In this task, there will be 20 trials in total.",
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0,),
          const Text(
            "How confident are you that the tone matched your heart-beat?",
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50,),
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
    ),
      ),
    );
  }
}
