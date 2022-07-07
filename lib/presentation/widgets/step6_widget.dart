import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Step6Widget extends StatefulWidget {
  Step6Widget({Key? key}) : super(key: key);

  @override
  State<Step6Widget> createState() => _Step6WidgetState();
}

class _Step6WidgetState extends State<Step6Widget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset(
        "assets/videos/heart_beat_sound_out_sync.mp4");
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
      Container(
          child: const Center(
              child: Text(
                  "It might seem like there is a delay between the sounds and the heartbeats you feel.\n\nPlay the video below to hear an example!", style: TextStyle(fontSize: 18.0),)))
    ]));
  }
}
