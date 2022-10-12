import 'package:Veris/presentation/bloc/auth_bloc.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/bloc/auth_state.dart';
import 'presentation/routes/routes.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AuthStatus>(
      state: context.select((AuthBloc bloc) => bloc.state.status),
      onGeneratePages: onGenerateAppViewPages,
    );
  }
}