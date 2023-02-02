import 'package:Veris/common/widgets/practice_slider_widget.dart';
import 'package:flutter/material.dart';


class Practice1SliderPage extends StatelessWidget {
  const Practice1SliderPage({super.key});

  final int number = 1;

  @override
  Widget build(BuildContext context) {
    return PracticeSliderWidget(number: number);
  }
}
