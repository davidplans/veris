import 'package:Veris/features/authentication/view/auth_view.dart';
import 'package:Veris/features/intro/view/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/core/user/auth_repository.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/style/theme.dart';

class HealthApp extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  final String studyProtocol;

  const HealthApp({
    Key? key,
    required this.authenticationRepository,
    required this.studyProtocol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) =>
            AuthBloc(authenticationRepository: authenticationRepository),
        child: MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: studyProtocol.isEmpty ? const IntroPage() : const AuthView(),
        ),
      ),
    );
  }
}
