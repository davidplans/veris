import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:Veris/features/pat/view/partials/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'knob_video_page.dart';

class DelayVideoPage extends StatefulWidget {
  const DelayVideoPage({super.key});

  @override
  State<DelayVideoPage> createState() => _DelayVideoPageState();
}

class _DelayVideoPageState extends State<DelayVideoPage> {
  final String _message =
      "It might seem like there is a delay between the sounds and the heartbeats you feel.\n\nPlay the video below to hear an example!";
  final String _videoSource = "assets/videos/heart_beat_sound_out_sync.mp4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Veris"),
      floatingActionButton: const SliderNavigation(
        nextPage: KnobVideoPage(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: VideoPlayerWidget(
        videoSource: _videoSource,
        message: _message,
      ),
    );
  }
}
