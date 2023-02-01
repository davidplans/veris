import 'package:flutter/material.dart';

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'short_tutorial_video_page.dart';

class ShortTutorialPage extends StatelessWidget {
  const ShortTutorialPage({super.key});

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
                      builder: (context) => const ShortTutorialVideoPage(),
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
