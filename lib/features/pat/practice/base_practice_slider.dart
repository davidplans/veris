import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/features/pat/practice/practice2_page.dart';
import 'package:Veris/features/pat/view/trial_page.dart';
import 'package:flutter/material.dart';

class PracticeSliderWidget extends StatefulWidget {
  final int number;
  const PracticeSliderWidget({Key? key, required this.number})
      : super(key: key);

  @override
  State<PracticeSliderWidget> createState() => _PracticeSliderWidgetState();
}

class _PracticeSliderWidgetState extends State<PracticeSliderWidget> {
  double _currentSliderValue = 5;

  _onChangeSlider(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          title: "Veris - PRACTICE TRIAL ${widget.number.toString()}"),
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
                  switch (widget.number) {
                    case 1:
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Practice2Page(),
                        ),
                      );
                      break;
                    case 2:
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TrialPage(),
                        ),
                      );
                  }
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
                max: 10,
                divisions: 10,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  _onChangeSlider(value);
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
