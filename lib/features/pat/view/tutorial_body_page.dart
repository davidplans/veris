import 'package:Veris/core/utils/image_constant.dart';
import 'package:Veris/features/pat/shared/slider_navigation.dart';
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
      appBar: const AppBarWidget(title: "Veris"),
      floatingActionButton: const SliderNavigation(
        nextPage: DontTryPulsePage(),
        nextButtonName: 'Continue',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              textAlign: TextAlign.center,
              "You can feel your heartbeat in different places in your body, such as your chest or your fingers. You will be asked to indicate where you felt your heartbeat on a body map (like the one below) once every 5 trials. You can choose any of the highlighted body parts or you can select \"nowhere\" if you haven't felt your heartbeat in any particular place.",
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              ImageConstant.imgMannequin2,
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}
