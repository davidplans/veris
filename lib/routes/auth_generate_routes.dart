import 'package:flutter/material.dart';
import 'package:Veris/features/authentication/bloc/auth_state.dart';
import 'package:Veris/features/home/view/home_page.dart';
import 'package:Veris/features/authentication/view/login_page.dart';

List<Page> onGenerateAppViewPages(AuthStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AuthStatus.authenticated:
      return [HomePage.page()];
    case AuthStatus.unauthenticated:
      return [LoginPage.page()];
  }
}