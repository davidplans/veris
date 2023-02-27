import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:flutter/material.dart';

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'short_tutorial_video_page.dart';

class ShortTutorialPage extends StatelessWidget {
  const ShortTutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Veris"),
      floatingActionButton: const SliderNavigation(
        nexPage: ShortTutorialVideoPage(),
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
                "Want to know how this might look like?\n\nPress “Continue” to watch a short tutorial.",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
