import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/core/user/authentication_repository.dart';
import 'package:Veris/features/authentication/services/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/features/authentication/view/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Enter your email'),
      body: BlocProvider<SignUpCubit>(
        create: (_) => SignUpCubit(context.read<AuthenticationRepository>()),
        child: const SignUpForm(),
      ),
    );
  }
}
