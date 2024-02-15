import 'package:Veris/core/user/authentication_repository.dart';
import 'package:Veris/features/authentication/bloc/auth_event.dart';
import 'package:Veris/features/authentication/services/login_cubit.dart';
import 'package:Veris/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/style/theme.dart';

class HealthApp extends StatefulWidget {
  final bool isStudyProtocolAvailable;

  const HealthApp({
    Key? key,
    required this.isStudyProtocolAvailable,
  }) : super(key: key);

  @override
  State<HealthApp> createState() => _HealthAppState();
}

class _HealthAppState extends State<HealthApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  AppRouter? router;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthenticationRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => AuthBloc(
                authenticationRepository:
                    context.read<AuthenticationRepository>())
              ..add(AuthenticationPersistRequested()),
          ),
          BlocProvider<LoginCubit>(
            create: (BuildContext context) =>
                LoginCubit(context.read<AuthenticationRepository>()),
          ),
        ],
        child: Builder(
          builder: (context) {
            router ??= AppRouter(
                navigatorKey: navigatorKey, authBloc: context.read<AuthBloc>());
            return MaterialApp.router(
              theme: theme,
              debugShowCheckedModeBanner: false,
              routerConfig: router?.router,
            );
          },
        ),
      ),
    );
  }
}
