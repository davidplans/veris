import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';

class ColoredBadgeContainer extends StatelessWidget {
  final Color containerColor;
  final Color containerTextColor;
  final String containerText;
  const ColoredBadgeContainer(
      {super.key,
      required this.containerColor,
      required this.containerText,
      required this.containerTextColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: containerColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: Text(
          containerText,
          style: TextStyle(
            fontFamily: FontConstants.interFontFamily,
            fontSize: FontConstants.fontSize14,
            fontWeight: FontWeight.w400,
            height: 1.142,
            color: containerTextColor,
          ),
        ),
      ),
    );
  }
}
