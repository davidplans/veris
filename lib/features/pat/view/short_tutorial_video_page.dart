import 'package:Veris/features/pat/shared/slider_navigation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'tutorial_slider_page.dart';

class ShortTutorialVideoPage extends StatefulWidget {
  const ShortTutorialVideoPage({super.key});

  @override
  State<ShortTutorialVideoPage> createState() => _ShortTutorialVideoPageState();
}

class _ShortTutorialVideoPageState extends State<ShortTutorialVideoPage> {
  late VideoPlayerController controller2;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    controller2.dispose();
    super.dispose();
  }

  loadVideoPlayer() {
    controller2 = VideoPlayerController.asset(
        "assets/videos/video_for_MAD_task_final.mp4");
    controller2.addListener(() {
      setState(() {});
    });
    controller2.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Veris"),
      floatingActionButton: const SliderNavigation(
        nexPage: TutorialSliderPage(),
        nextButtonName: 'Continue',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
              width: 350,
              child: Column(children: [
                AspectRatio(
                  aspectRatio: controller2.value.aspectRatio,
                  child: VideoPlayer(controller2),
                ),
                Container(
                    child: VideoProgressIndicator(controller2,
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
                            if (controller2.value.isPlaying) {
                              controller2.pause();
                            } else {
                              controller2.play();
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            controller2.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 40,
                          )),
                      // IconButton(
                      //     onPressed: () {
                      //       controller2.seekTo(const Duration(seconds: 0));
                      //       setState(() {});
                      //     },
                      //     icon: const Icon(Icons.stop))
                    ],
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
