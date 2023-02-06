import 'package:flutter/material.dart';

class EstimatedBPM extends StatelessWidget {
  const EstimatedBPM({
    super.key,
    required int bpm,
  }) : _bpm = bpm;

  final int _bpm;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Estimated BPM",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        Text(
          _bpm > 30 && _bpm < 150 ? _bpm.toString() : "--",
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}
