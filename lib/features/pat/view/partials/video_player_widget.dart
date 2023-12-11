import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoSource;
  final String message;
  const VideoPlayerWidget(
      {super.key, required this.videoSource, required this.message});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _initVideoPlayer(widget.videoSource);
    super.initState();
  }

  Future<void> _initVideoPlayer(String source) async {
    _controller = VideoPlayerController.asset(source);
    _controller.addListener(() {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    await _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: widget.message != "" ? Padding(
            padding: const EdgeInsets.only(
                left: 22.0, top: 10.0, right: 22.0, bottom: 0),
            child: Text(
              widget.message,
              style: const TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ) : Container(),
        ),
        const SizedBox(
          height: 10,
        ),
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        VideoProgressIndicator(
          _controller,
          allowScrubbing: true,
          colors: const VideoProgressColors(
            backgroundColor: Colors.redAccent,
            playedColor: Colors.green,
            bufferedColor: Colors.purple,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                },
                icon: Icon(
                  _controller.value.isPlaying ? Icons.stop : Icons.play_arrow,
                  size: 40,
                )),
          ],
        ),
      ],
    );
  }
}
