import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:flutter/material.dart';

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'short_tutorial_text_page.dart';

class KnobPointPage extends StatelessWidget {
  const KnobPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Veris"),
      floatingActionButton: const SliderNavigation(
        nexPage: ShortTutorialPage(),
        nextButtonName: 'Continue',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                textAlign: TextAlign.center,
                "Your objective is to find the point on the dial where the heartbeat and sound is in sync, by turning the dial left or right.",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
