import 'package:flutter/material.dart';
import 'package:Veris/features/home/view/home_page.dart';

final routesConfig = <String, WidgetBuilder>{
  "/home": (BuildContext context) => const HomePage(),
};

class Routes {
  static void goHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
}
