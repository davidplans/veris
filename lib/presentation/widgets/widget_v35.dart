import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'widget_v36.dart';

class V35Widget extends StatefulWidget {
  const V35Widget({super.key});

  @override
  State<V35Widget> createState() => _V35WidgetState();
}

class _V35WidgetState extends State<V35Widget> {
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
      appBar:
          AppBar(title: const Text('Veris'), automaticallyImplyLeading: false),
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
                                      Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const V36Widget(),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
              // width: 250,
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
