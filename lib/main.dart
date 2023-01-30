import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/bloc_observer.dart';
import 'package:Veris/core/user/auth_repository.dart';
import 'package:Veris/health_app.dart';
import 'package:flutter/services.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Color(0XFF0F2042),
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Color(0xFF000000),
            systemNavigationBarIconBrightness: Brightness.dark),
      );
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      final authenticationRepository = AuthenticationRepository();
      runApp(HealthApp(
        authenticationRepository: authenticationRepository,
      ));
    },
    blocObserver: AppBlocObserver(),
  );
}
