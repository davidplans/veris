import 'package:Veris/features/pat/practice/base_practice.dart';
import 'package:flutter/material.dart';

class Practice2Page extends StatelessWidget {
  const Practice2Page({super.key});

  final int number = 2;

  @override
  Widget build(BuildContext context) {
    return PracticeWidget(number: number);
  }
}
