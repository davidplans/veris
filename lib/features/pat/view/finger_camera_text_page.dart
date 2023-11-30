import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:flutter/material.dart';

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'delay_video_page.dart';

class FingerCameraPage extends StatelessWidget {
  const FingerCameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarWidget(title: "Veris"),
        floatingActionButton: SliderNavigation(
          nexPage: DelayVideoPage(),
          nextButtonName: 'Next',
          isNeedHideBackButton: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
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
