import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'app_bar_widget.dart';
import 'widget_v32.dart';

class V31Widget extends StatefulWidget {
  const V31Widget({super.key});

  @override
  State<V31Widget> createState() => _V31WidgetState();
}

class _V31WidgetState extends State<V31Widget> {
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
      appBar:
          AppBarWidget(title: "Veris"),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: FloatingActionButton.extended(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                backgroundColor: const Color(0XFF0F2042),
                onPressed: () {
                  controller1.dispose();
                  Navigator.of(context).pop();
                },
                label: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
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
                  controller1.pause();
                                      Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const V32Widget(),
                    ),
                  );
                },
                label: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        child: Column(
          children: [
            Container(
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 22.0, top: 10.0, right:22.0, bottom:0),
                  child: Text(
                    "It might seem like there is a delay between the sounds and the heartbeats you feel.\n\nPlay the video below to hear an example!",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
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
