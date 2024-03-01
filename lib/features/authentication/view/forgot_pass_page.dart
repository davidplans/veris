import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/features/authentication/services/forgot_pass_cubit.dart';
import 'package:Veris/features/authentication/view/forgot_pass_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const AppBarWidget(
          title: '',
        ),
        body: BlocProvider(
          create: (_) => ForgotPasswordCubit(),
          child: const ForgotPasswordForm()));
  }
}

