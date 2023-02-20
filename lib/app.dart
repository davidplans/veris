import 'package:Veris/features/intro/view/intro_page.dart';
import 'package:Veris/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/core/user/auth_repository.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/style/theme.dart';

class HealthApp extends StatelessWidget {
  const HealthApp({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) =>
            AuthBloc(authenticationRepository: _authenticationRepository),
        child: MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
    ),
      ),
    );
  }
}


