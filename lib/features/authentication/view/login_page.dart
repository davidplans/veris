import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/features/authentication/services/login_cubit.dart';
import 'package:Veris/features/authentication/view/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/core/user/auth_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const AppBarWidget(
        title: '',
      ),
      body: BlocProvider(
        create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: const IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 40.0),
                    child: LoginForm(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
