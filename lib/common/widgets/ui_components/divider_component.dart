import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';

class DividerComponent extends StatelessWidget {
  const DividerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Divider(
          height: 1.0,
          color: ColorConstants.separatorPrimaryColor,
        )),
        Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            'or',
            style: TextStyle(
                fontFamily: FontConstants.interFontFamily,
                fontSize: FontConstants.fontSize16,
                fontWeight: FontWeight.w400,
                height: 1.375,
                color: ColorConstants.textSecondaryColor),
          ),
        ),
        Expanded(
            child: Divider(
          height: 1.0,
          color: ColorConstants.separatorPrimaryColor,
        ))
      ],
    );
  }
}