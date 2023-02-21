import 'package:Veris/features/authentication/view/auth_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static void goHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AuthView()));
  }
}