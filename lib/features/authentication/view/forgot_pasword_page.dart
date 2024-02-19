import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/common/widgets/ui_components/input_text_component.dart';
import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const AppBarWidget(
          title: '',
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 40.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                      fontFamily: FontConstants.interFontFamily,
                      fontSize: FontConstants.fontSize24,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.textPrimaryColor,
                      height: 1.25),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Enter email associated with Veris account and the reset link will be send',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: FontConstants.interFontFamily,
                      fontSize: FontConstants.fontSize16,
                      fontWeight: FontWeight.w400,
                      color: ColorConstants.textSecondaryColor,
                      height: 1.25),
                ),
              ),
              InputTextComponent(
                  keyboardType: TextInputType.emailAddress,
                  placeHolderText: 'Enter email',
                  labelText: 'Email',
                  hintText: '',
                  onChanged: (text) {}),
                 const Spacer(),
              MainButtonComponent(
                  title: 'Reset password',
                  onPressed: () {},
                  backgroundColor: ColorConstants.btnPrimaryDefaultColor,
                  titleColor: ColorConstants.textInvertedColor)
            ],
          ),
        ));
  }
}
