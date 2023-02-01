import 'package:Veris/features/pat/view/trial_page.dart';
import 'package:flutter/material.dart';

import 'app_bar_widget.dart';

class Practice2SliderPage extends StatefulWidget {
  const Practice2SliderPage({Key? key}) : super(key: key);

  @override
  State<Practice2SliderPage> createState() => _Practice2SliderPageState();
}

class _Practice2SliderPageState extends State<Practice2SliderPage> {
  double _currentSliderValue = 50;

  _changeSlider(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Veris - PRACTICE TRIAL 2"),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 1,
              child: FloatingActionButton.extended(
                backgroundColor: const Color(0XFF0F2042),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TrialPage(),
                    ),
                  );
                },
                label: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
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
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "How confident are you that the tone matched you heart-beat?",
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 100.0,
              ),
              Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 100,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  _changeSlider(value);
                },
              ),
              Row(
                children: const [
                  Expanded(child: Text("Not at all \nconfident")),
                  Expanded(
                      child: Text(
                    "Extremely \nconfident",
                    textAlign: TextAlign.end,
                  )),
                ],
              )
            ],
          )),
    );
  }
}
