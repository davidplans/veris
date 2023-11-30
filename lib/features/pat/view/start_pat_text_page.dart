import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:Veris/features/pat/view/find_place_text_page.dart';
import 'package:Veris/features/pat/view/trial_page.dart';
import 'package:Veris/features/pat/view/trial_page2.dart';
import 'package:flutter/material.dart';

class StartPatPage extends StatelessWidget {
  const StartPatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarWidget(title: "Veris"),
        floatingActionButton: SliderNavigation(
          // nexPage: FindPlacePage(),
          nexPage: TrialPage2(),
          isNeedHideBackButton: true,
          nextButtonName: 'Continue',
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
                  "How well can you match a sound with your heartbeat?\n\nLet’s find out!",
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
        ));
  }
}
