import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/routes/routes.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CompleteWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String? text;
  final String buttonTitle;

  const CompleteWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.buttonTitle,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 30.0),
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 68.0,
              height: 68.0,
              colorFilter: const ColorFilter.mode(
                  ColorConstants.iconSecondaryColor, BlendMode.srcIn),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: FontConstants.interFontFamily,
                    fontSize: FontConstants.fontSize24,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.textPrimaryColor),
              ),
            ),
            Text(
              text ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: FontConstants.interFontFamily,
                  fontSize: FontConstants.fontSize16,
                  fontWeight: FontWeight.w400,
                  color: ColorConstants.textSecondaryColor),
            ),
            const Spacer(),
            MainButtonComponent(
              title: buttonTitle,
              onPressed: () => context.go(Routes.home.path),
              backgroundColor: ColorConstants.btnPrimaryDefaultColor,
              titleColor: ColorConstants.textInvertedColor,
            ),
          ],
        ),
      ),
    );
  }
}
