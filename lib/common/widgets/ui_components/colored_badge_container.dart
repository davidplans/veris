import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';

class ColoredBadgeContainer extends StatelessWidget {
  final String colorKey;
  final String containerText;
  const ColoredBadgeContainer({
    super.key,
    required this.colorKey,
    required this.containerText,
  });

  _buildContainer(
      Color containerColor, Color containerTextColor, String containerText) {
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

  @override
  Widget build(BuildContext context) {
    Widget badge = Container();
    switch (colorKey) {
      case 'green':
        badge = _buildContainer(ColorConstants.badgeBackgroundGreenColor,
            ColorConstants.badgeTextGreenColor, containerText);
        break;
      case 'gray':
        badge = _buildContainer(ColorConstants.badgeBackgroundGreyColor,
            ColorConstants.badgeTextGreyColor, containerText);
        break;
              case 'pink':
        badge = _buildContainer(ColorConstants.badgeBackgroundPinkColor,
            ColorConstants.badgeTextPinkColor, containerText);
        break;
                      case 'orange':
        badge = _buildContainer(ColorConstants.badgeBackgroundOrangeColor,
            ColorConstants.badgeTextOrangeColor, containerText);
        break;
    }

    return badge;
  }
}
