import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/features/authentication/view/signup_page.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: WelcomePage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const WelcomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SvgPicture.asset('assets/images/circles.svg'),
              const Column(
                children: [
                  Text(
                    'Welcome to Veris',
                    style: TextStyle(
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontConstants.fontSize40,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.generalPrimaryColor,
                        height: 1.3,
                        letterSpacing: -1.5),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(35.0, 16.6, 35.0, 35.0),
                    child: Text(
                      'Participate in research surveys directly from your smartphone',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FontConstants.interFontFamily,
                        fontSize: FontConstants.fontSize16,
                        fontWeight: FontWeight.w400,
                        color: ColorConstants.textPrimaryColor,
                        height: 1.375,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 40.0),
            child: Column(
              children: [
                MainButtonComponent(
                  title: 'Sign up with Email',
                  onPressed: () {
                    Navigator.of(context).push(SignUpPage.route());
                  },
                  backgroundColor: ColorConstants.btnPrimaryDefaultColor,
                  titleColor: ColorConstants.textInvertedColor,
                  prefixIconPath: 'assets/icons/email.svg',
                ),
                const SizedBox(
                  height: 12.0,
                ),
                MainButtonComponent(
                  title: 'Sign up with Google',
                  onPressed: (() {}),
                  backgroundColor: ColorConstants.btnLogInGoogleColor,
                  titleColor: ColorConstants.textInvertedColor,
                  prefixIconPath: 'assets/icons/google.svg',
                ),
                const SizedBox(
                  height: 12.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'I already have an account',
                    style: TextStyle(
                      fontFamily: FontConstants.interFontFamily,
                      fontSize: FontConstants.fontSize16,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.generalPrimaryColor,
                      height: 1.25,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
