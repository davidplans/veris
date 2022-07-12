import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class BeatsSlider extends StatefulWidget {
  const BeatsSlider({Key? key}) : super(key: key);

  @override
  State<BeatsSlider> createState() => _BeatsSliderState();
}

class _BeatsSliderState extends State<BeatsSlider> {
  double _currentSliderValue = 60;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // _getAssets();
  }

  _getAssets() async {
    await player
        .setAudioSource(AudioSource.uri(
            Uri.parse('assets/sounds/beep.mp3')))
        .then((value) {
      player.setLoopMode(LoopMode.all);
      _playBeep(_currentSliderValue);
    });
  }

  _playBeep(double speed) {
    player.setSpeed(double.parse((speed / 60).toStringAsFixed(1)));
    player.play();
    // player.setAsset("assets/sounds/beep.mp3").then((value) => player.play());
  }

  _changeSlider(double value) {
    player.pause().then((v) {
      setState(() {
        _currentSliderValue = value;
        _playBeep(value);
      });
    });
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _currentSliderValue.round().toString(),
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
        Slider(
          value: _currentSliderValue,
          max: 200,
          divisions: 200,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            _changeSlider(value);
          },
        ),
      ],
    );
  }
}
