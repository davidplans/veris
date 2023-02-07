import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:flutter/material.dart';

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'start_practice_page.dart';

class DontTryPulsePage extends StatelessWidget {
  const DontTryPulsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Veris"),
      floatingActionButton: const SliderNavigation(
        nexPage: StartPracticePage(),
        nextButtonName: 'Continue',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                textAlign: TextAlign.center,
                "For the duration of this task, please do not actively try to feel your pulse with your hand; we are only interested in what you feel! You might feel your heartbeat in various bodily locations. Just make sure you pick one and stick to using that one during the task.\n\nWhen you are ready to start, please sit comfortably upright with your earphones on and press “Сontinue”.",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
