import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/features/authentication/bloc/reset/reset_pass_cubit.dart';
import 'package:Veris/features/authentication/view/reset_pass_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const AppBarWidget(
          title: '',
        ),
        body: BlocProvider(
            create: (_) => ResetPasswordCubit(),
            child: const ResetPasswordForm()));
  }
}
