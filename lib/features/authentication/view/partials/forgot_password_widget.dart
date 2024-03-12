import 'package:Veris/routes/routes.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Text(
              "Forgot password?",
              style: TextStyle(
                  fontFamily: FontConstants.interFontFamily,
                  fontSize: FontConstants.fontSize16,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.generalPrimaryColor),
            ),
          ),
        ),
      ),
      onTap: () {
        context.go(Routes.forgotPassword.path);
      },
    );
  }
}