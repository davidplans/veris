import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:Veris/features/pat/view/partials/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'knob_point_text_page.dart';

class KnobVideoPage extends StatefulWidget {
  const KnobVideoPage({super.key});

  @override
  State<KnobVideoPage> createState() => _KnobVideoPageState();
}

class _KnobVideoPageState extends State<KnobVideoPage> {
  final String _message =
      "In order to rectify the delay, you will be asked to move a dial until the sounds are in most sync with your heartbeats. \n\nPlay the video below to hear an example!";
  final String _videoSource = "assets/videos/heart_beat_sound_out_sync.mp4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(title: "Veris"),
        floatingActionButton: const SliderNavigation(
          nextPage: KnobPointPage(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: VideoPlayerWidget(videoSource: _videoSource, message: _message));
  }
}
