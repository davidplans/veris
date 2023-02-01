import 'package:flutter/material.dart';

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'dont_try_pulse_text_page.dart';

class TutorialBodyPage extends StatefulWidget {
  const TutorialBodyPage({super.key});

  @override
  State<TutorialBodyPage> createState() => _TutorialBodyPageState();
}

class _TutorialBodyPageState extends State<TutorialBodyPage> {
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
                      builder: (context) => const DontTryPulsePage(),
                    ),
                  );
                },
                label: const Text(
                  "Continue",
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
            Container(
              child: const Text(
                textAlign: TextAlign.center,
                "You can feel your heartbeat in different places in your body, such as your chest or your fingers. You will be asked to indicate where you felt your heartbeat on a body map (like the one below) once every 5 trials. You can choose any of the highlighted body parts or you can select \"nowhere\" if you haven't felt your heartbeat in any particular place.",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/mannequin2.png',
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}