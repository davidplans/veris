import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:flutter/material.dart';
import 'get_ready_text_page.dart';

class FindPlacePage extends StatelessWidget {
  const FindPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: "Veris"),
        floatingActionButton: const SliderNavigation(nexPage: GetReadyPage()),
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
                  "Find a quiet place where you can sit comfortably upright for around 10 minutes. We'll be recording your heart beats, so you therefore need to keep your hand still and in the correct position. Also, make sure you turn your phone's volume up and don't use earphones (plugged or bluetooth)",
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
        ));
  }
}
