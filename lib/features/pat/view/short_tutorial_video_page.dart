import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:Veris/features/pat/view/partials/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'tutorial_slider_page.dart';

class ShortTutorialVideoPage extends StatefulWidget {
  const ShortTutorialVideoPage({super.key});

  @override
  State<ShortTutorialVideoPage> createState() => _ShortTutorialVideoPageState();
}

class _ShortTutorialVideoPageState extends State<ShortTutorialVideoPage> {
  final String _videoSource = "assets/videos/video_for_MAD_task_final.mp4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Veris"),
      floatingActionButton: const SliderNavigation(
        nextPage: TutorialSliderPage(),
        nextButtonName: 'Continue',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Center(
            child: VideoPlayerWidget(videoSource: _videoSource, message: "")),
      ),
    );
  }
}
