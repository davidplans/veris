import 'package:flutter/material.dart';
import 'package:Veris/core/view/bottom_nav_bar.dart';

final routesConfig = <String, WidgetBuilder>{
  "/home": (BuildContext context) => const BottomNavBar(),
};

class Routes {
  static void goHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
}
