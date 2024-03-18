import 'dart:async';
import 'dart:developer';

import 'package:Veris/core/view/bottom_nav_bar.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/features/authentication/bloc/auth_state.dart';
import 'package:Veris/features/authentication/view/forgot_pass_page.dart';
import 'package:Veris/features/authentication/view/login_page.dart';
import 'package:Veris/features/authentication/view/signup_page.dart';
import 'package:Veris/features/intro/view/intro_page.dart';
import 'package:Veris/features/intro/view/welcome_page.dart';
import 'package:Veris/features/qr_scanner/qr_scanner.dart';
import 'package:Veris/features/surveys/view/survey_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  welcome('/welcome'),
  login('/login'),
  signup('/signup'),
  home('/home'),
  intro('/intro'),
  scanQR('/scan_qr'),
  forgotPassword('/forgot_password'),
  survey('/survey');

  const Routes(this.path);
  final String path;
}

class AppRouter {
  final GlobalKey<NavigatorState>? navigatorKey;
  final AuthBloc authBloc;
  AppRouter({required this.authBloc, required this.navigatorKey});
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    initialLocation: Routes.welcome.path,
    routes: [
      GoRoute(
        path: Routes.welcome.path,
        name: Routes.welcome.name,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.signup.path,
        name: Routes.signup.name,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: Routes.forgotPassword.path,
        name: Routes.forgotPassword.name,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (context, state) => const BottomNavBar(),
      ),
      GoRoute(
        path: Routes.intro.path,
        name: Routes.intro.name,
        builder: (context, state) => const IntroPage(),
      ),
      GoRoute(
        path: Routes.scanQR.path,
        name: Routes.scanQR.name,
        builder: (context, state) => const QrScanner(),
      ),
      GoRoute(
          path: Routes.survey.path,
          name: Routes.survey.name,
          builder: (context, state) {
            Map<String, dynamic> args = state.extra as Map<String, dynamic>;
            return SurveyPage(
              questions: args['questions'],
              moduleId: args['moduleId'],
              sectionId: args['sectionId'],
              sectionName: args['sectionName'],
              moduleName: args['moduleName'],
            );
          }),
    ],
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      log('STATE: ${state.matchedLocation}');
      switch (authBloc.state.status) {
        case AuthStatus.authenticated:
          if (state.matchedLocation == Routes.login.path ||
              state.matchedLocation == Routes.welcome.path ||
              state.matchedLocation == Routes.signup.path) {
            return Routes.home.path;
          }
          return null;
        case AuthStatus.unauthenticated:
          if (state.matchedLocation == Routes.login.path) {
            return Routes.login.path;
          }
          if (state.matchedLocation == Routes.signup.path) {
            return Routes.signup.path;
          }
          if (state.matchedLocation == Routes.forgotPassword.path) {
            return Routes.forgotPassword.path;
          }
          return Routes.welcome.path;
        case AuthStatus.authenticating:
          return null;
        case AuthStatus.error:
          return null;
        case AuthStatus.initial:
          return null;
      }
    },
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
