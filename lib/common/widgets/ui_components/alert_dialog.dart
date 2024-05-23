import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/routes/routes.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlertDialogWidget {
  static showAlertDialog(BuildContext context, String content,
      String positiveButtonTitle,
      [negativeButtonTitle]) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 32.0),
          content: Text(
            content,
            style: const TextStyle(
                fontFamily: FontConstants.interFontFamily,
                fontSize: FontConstants.fontSize17,
                fontWeight: FontWeight.w500,
                color: ColorConstants.textPrimaryColor),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButtonComponent(
                  title: positiveButtonTitle,
                  onPressed: () => context.go(Routes.complete.path,
                  extra: {
                    'iconPath': 'assets/icons/illustrations/success_star.svg',
                    'title': 'Thank you for completing questionnaire',
                    'buttonTitle': 'Return to home',
                  }),
                  backgroundColor: ColorConstants.btnPrimaryDefaultColor,
                  titleColor: ColorConstants.textInvertedColor,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                negativeButtonTitle == null
                    ? Container()
                    : TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          negativeButtonTitle,
                          style: const TextStyle(
                              fontFamily: FontConstants.interFontFamily,
                              fontSize: FontConstants.fontSize16,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.textPrimaryColor),
                        ),
                      )
              ],
            ),
          ],
        );
      },
    );
  }
}
