import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'knob_point_text_page.dart';

class KnobVideoPage extends StatefulWidget {
  const KnobVideoPage({super.key});

  @override
  State<KnobVideoPage> createState() => _KnobVideoPageState();
}

class _KnobVideoPageState extends State<KnobVideoPage> {
  late VideoPlayerController controller1;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  loadVideoPlayer() {
    controller1 = VideoPlayerController.asset(
        "assets/videos/heart_beat_sound_out_sync.mp4");
    controller1.addListener(() {
      setState(() {});
    });
    controller1.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Veris"),
      floatingActionButton: const SliderNavigation(
        nexPage: KnobPointPage(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        child: Column(
          children: [
            Container(
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(22.0),
                  child: Text(
                    "In order to rectify the delay, you will be asked to move a dial until the sounds are in most sync with your heartbeats. \n\nPlay the video below to hear an example!",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: controller1.value.aspectRatio,
              child: VideoPlayer(controller1),
            ),
            Container(
                child: VideoProgressIndicator(controller1,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      backgroundColor: Colors.redAccent,
                      playedColor: Colors.green,
                      bufferedColor: Colors.purple,
                    ))),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        if (controller1.value.isPlaying) {
                          controller1.pause();
                        } else {
                          controller1.play();
                        }
                        // setState(() {});
                      },
                      icon: Icon(
                        controller1.value.isPlaying
                            ? Icons.stop
                            : Icons.play_arrow,
                        size: 40,
                      )),
                  // IconButton(
                  //     onPressed: () {
                  //       controller.seekTo(const Duration(seconds: 0));
                  //       setState(() {});
                  //     },
                  //     icon: const Icon(Icons.stop))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
