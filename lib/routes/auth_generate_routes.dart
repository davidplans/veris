import 'package:flutter/material.dart';
import 'package:Veris/features/authentication/bloc/auth_state.dart';
import 'package:Veris/core/view/home_nav_bar.dart';
import 'package:Veris/features/authentication/view/login_page.dart';

List<Page> onGenerateAppViewPages(AuthStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AuthStatus.authenticated:
      return [HomeBottomNavBar.page()];
    case AuthStatus.unauthenticated:
      return [LoginPage.page()];
  }
}