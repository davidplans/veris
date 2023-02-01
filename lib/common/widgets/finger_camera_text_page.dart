import 'package:flutter/material.dart';

import 'app_bar_widget.dart';
import 'delay_video_page.dart';


class FingerCameraPage extends StatelessWidget {
  const FingerCameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: "Veris"),
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
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  backgroundColor: const Color(0XFF0F2042),
                  onPressed: () {
                                        Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DelayVideoPage(),
                      ),
                    );
                  },
                  label: const Text(
                    "Next",
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
          child: Center(
            child: Column(
              children: const [
                SizedBox(
                  height: 200.0,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Ok, thanks! In the main task, you will be asked to place your finger on the phone camera (on the back) so that the app can read your heartbeat.\n\nOnce your finger is in position, you will hear a series of sounds.\n\nEach sound actually represents one of your own heartbeats!",
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
        ));
  }
}
