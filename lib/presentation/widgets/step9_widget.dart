import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Step9Widget extends StatefulWidget {
  Step9Widget({Key? key}) : super(key: key);

  @override
  State<Step9Widget> createState() => _Step9WidgetState();
}

class _Step9WidgetState extends State<Step9Widget> {
 late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset(
        "assets/videos/video_for_MAD_task_final.mp4");
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,

        child: Column(children: [
      AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      ),
      Container(
          child: VideoProgressIndicator(controller,
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
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }
                  setState(() {});
                },
                icon: Icon(controller.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow)),
            IconButton(
                onPressed: () {
                  controller.seekTo(const Duration(seconds: 0));
                  setState(() {});
                },
                icon: const Icon(Icons.stop))
          ],
        ),
      ),
    ]));
  }
}