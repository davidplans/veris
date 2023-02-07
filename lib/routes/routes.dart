import 'package:flutter/material.dart';
import 'package:Veris/core/view/home_nav_bar.dart';

final routesConfig = <String, WidgetBuilder>{
  "/home": (BuildContext context) => const HomeBottomNavBar(),
};

class Routes {
  static void goHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
}
