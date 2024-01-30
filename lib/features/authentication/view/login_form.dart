import 'package:Veris/common/widgets/ui_components/input_text_component.dart';
import 'package:Veris/common/widgets/ui_components/default_button.dart';
import 'package:Veris/features/authentication/models/login_state.dart';
import 'package:Veris/features/authentication/services/login_cubit.dart';
import 'package:Veris/features/authentication/view/signup_page.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Login in to Veris",
                  style: TextStyle(
                      color: ColorConstants.textPrimaryColor,
                      fontFamily: FontConstants.interFontFamily,
                      fontSize: FontConstants.fontSize24,
                      fontWeight: FontWeight.w500,
                      height: 1.166666),
                ),
                const SizedBox(height: 20),
                _EmailInput(),
                const SizedBox(height: 20),
                _PasswordInput(),
              ],
            ),
          ),
          const SizedBox(height: 70),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                _ForgotPassword(),
                const SizedBox(height: 10),
                _LoginButton(),
                const SizedBox(height: 12),
                const _Divider(),
                const SizedBox(height: 12),
                _SignUpButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
          height: 1.0,
          color: ColorConstants.separatorPrimaryColor,
        )),
        Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            'or',
            style: TextStyle(
                fontFamily: FontConstants.interFontFamily,
                fontSize: FontConstants.fontSize16,
                fontWeight: FontWeight.w400,
                height: 1.375,
                color: ColorConstants.textSecondaryColor),
          ),
        ),
        Expanded(
            child: Divider(
          height: 1.0,
          color: ColorConstants.separatorPrimaryColor,
        ))
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return InputTextComponent(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          placeHolderText: 'Enter email',
          labelText: 'Email',
          hintText: '',
          errorText: state.email.isNotValid ? 'Incorrect email' : null,
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return InputTextComponent(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          isObscureText: false,
          labelText: 'Password',
          placeHolderText: 'Enter password',
          errorText: state.password.isNotValid ? 'Incorrect password' : null,
          assetsList: const [
            'assets/icons/visibility.svg',
            'assets/icons/visibility-off.svg'
          ],
        );
      },
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Text(
              "Forgot password?",
              style: TextStyle(
                  fontFamily: FontConstants.interFontFamily,
                  fontSize: FontConstants.fontSize16,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.generalPrimaryColor),
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF189B8D)))
            : DefaultButton(
                key: const Key('loginForm_continue_raisedButton'),
                title: 'Log In',
                backgroundColor: ColorConstants.btnPrimaryDefaultColor,
                titleColor: ColorConstants.textInvertedColor,
                onPressed: (_) =>
                    context.read<LoginCubit>().logInWithCredentials(),
              );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      key: const Key('loginForm_createAccount_flatButton'),
      title: 'Log in with Google',
      titleColor: ColorConstants.iconInvertedColor,
      backgroundColor: ColorConstants.btnLogInGoogleColor,
      prefixIconPath: "assets/icons/google.svg",
      onPressed: (_) => Navigator.of(context).push<void>(SignUpPage.route()),
    );
  }
}
