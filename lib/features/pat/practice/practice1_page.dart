import 'package:Veris/features/pat/practice/base_practice.dart';
import 'package:flutter/material.dart';

class Practice1Page extends StatelessWidget {
  const Practice1Page({super.key});

  final int number = 1;

  @override
  Widget build(BuildContext context) {
    return PracticeWidget(number: number);
  }
}
