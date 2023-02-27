import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/core/utils/image_constant.dart';
import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:flutter/material.dart';

import '../baselines/baseline_page.dart';

class GetReadyPage extends StatelessWidget {
  const GetReadyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: "Veris"),
        floatingActionButton: const SliderNavigation(nexPage: BaselinePage()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  ImageConstant.imgHand,
                  width: 200,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "Getting ready to check your heartbeat.",
                  style: TextStyle(fontSize: 28.0),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "We will shortly turn on the LED Flash and camera on this phone, and will use it to take your heart rate. Please place your index finger across both camera and flash.",
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
        ));
  }
}
