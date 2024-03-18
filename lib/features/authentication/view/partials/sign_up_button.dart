
import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainButtonComponent(
      key: const Key('loginForm_createAccount_flatButton'),
      title: 'Log in with Google',
      titleColor: ColorConstants.iconInvertedColor,
      backgroundColor: ColorConstants.btnLogInGoogleColor,
      prefixIconPath: "assets/icons/google.svg",
      onPressed: () {
        // context.go(Routes.signup.path);
      },
    );
  }
}
