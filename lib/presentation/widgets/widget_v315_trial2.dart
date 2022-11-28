import 'package:Veris/presentation/pages/trial_BMP_page.dart';
import 'package:flutter/material.dart';



class V315Trial1Widget extends StatefulWidget {
  const V315Trial1Widget({Key? key}) : super(key: key);

  @override
  State<V315Trial1Widget> createState() => _V315Trial1WidgetState();
}

class _V315Trial1WidgetState extends State<V315Trial1Widget> {
  double _currentSliderValue = 50;

  _changeSlider(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                appBar: AppBar(
              title: const Text('Veris - PRACTICE TRIAL 2'),
              automaticallyImplyLeading: false),
                        floatingActionButton: Padding(
            padding: const EdgeInsets.all(20.0),
            child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Expanded(
                      //   flex: 1,
                      //   child: FloatingActionButton.extended(
                      //     icon: const Icon(
                      //       Icons.arrow_back,
                      //       color: Colors.white,
                      //     ),
                      //     backgroundColor: const Color(0XFF0F2042),
                      //     onPressed: () {
                      //       Navigator.of(context).pop();
                      //     },
                      //     label: const Text(
                      //       "Back",
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      // ),
                      const Expanded(flex: 1, child: SizedBox()),
                      const Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 1,
                        child: FloatingActionButton.extended(
                          backgroundColor: const Color(0XFF0F2042),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const TrialBMPPage(),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
      children: [
        const SizedBox(height: 20.0,),
        const Text(
          "How confident are you that the tone matched you heart-beat?",
          style: TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 100.0,),
        Slider(
          value: _currentSliderValue,
          max: 100,
          divisions: 100,
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
    )
      ),
    );
  }
}
