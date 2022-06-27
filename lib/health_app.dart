import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_schema_health/data/repositories/auth_repository.dart';
import 'package:flutter_schema_health/presentation/bloc/auth_bloc.dart';
import 'package:flutter_schema_health/presentation/bloc/auth_state.dart';
import 'package:flutter_schema_health/presentation/routes/routes.dart';
import 'package:flutter_schema_health/style/theme.dart';

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
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return MaterialApp(
      theme: theme,
      home: FlowBuilder<AuthStatus>(
        state: context.select((AuthBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
 
  }
}
