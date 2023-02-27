import 'package:Veris/features/pat/practice/base_practice_slider.dart';
import 'package:flutter/material.dart';

class Practice1SliderPage extends StatelessWidget {
  const Practice1SliderPage({super.key});

  final int number = 1;

  @override
  Widget build(BuildContext context) {
    return PracticeSliderWidget(number: number);
  }
}
