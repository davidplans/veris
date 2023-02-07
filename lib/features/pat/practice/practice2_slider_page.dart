import 'package:Veris/features/pat/practice/base_practice_slider.dart';
import 'package:flutter/material.dart';

class Practice2SliderPage extends StatelessWidget {
  const Practice2SliderPage({super.key});

  final int number = 2;

  @override
  Widget build(BuildContext context) {
    return PracticeSliderWidget(number: number);
  }
}
