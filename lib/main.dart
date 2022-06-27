import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_schema_health/bloc_observer.dart';
import 'package:flutter_schema_health/data/repositories/auth_repository.dart';
import 'package:flutter_schema_health/health_app.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authenticationRepository = AuthenticationRepository();
      runApp(HealthApp(
        authenticationRepository: authenticationRepository,
      ));
    },
    blocObserver: AppBlocObserver(),
  );
}
