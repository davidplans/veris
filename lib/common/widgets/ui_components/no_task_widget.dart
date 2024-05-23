import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoTaskWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String text;
  const NoTaskWidget(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250.0,
      child: Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: ColorConstants.cardShadowColor.withOpacity(0.03),
        spreadRadius: 0,
        blurRadius: 8.0,
        offset: const Offset(4, 4), // changes position of shadow
      ),
    ],
  ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: const ColorFilter.mode(
                  ColorConstants.iconDisableColor, BlendMode.srcIn),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: FontConstants.interFontFamily,
                  fontSize: FontConstants.fontSize20,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.textPrimaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: FontConstants.interFontFamily,
                  fontSize: FontConstants.fontSize16,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.textSecondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
