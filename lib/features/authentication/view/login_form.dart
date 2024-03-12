import 'package:Veris/common/widgets/ui_components/divider_component.dart';
import 'package:Veris/common/widgets/ui_components/input_text_component.dart';
import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/core/utils/main_constants.dart';
import 'package:Veris/features/authentication/models/login_state.dart';
import 'package:Veris/features/authentication/services/login_cubit.dart';
import 'package:Veris/features/authentication/view/partials/forgot_password_widget.dart';
import 'package:Veris/features/authentication/view/partials/sign_up_button.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _canEmailValidate = false;
  bool _canPasswordValidate = false;
  final TextEditingController _emailController = TextEditingController();
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
      child: Form(
        key: _formKey,
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
                  BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.email != current.email,
                    builder: (context, state) {
                      return InputTextComponent(
                        key: const Key('loginForm_emailInput_textField'),
                        onChanged: (email) {
                          _canEmailValidate = false;
                          context.read<LoginCubit>().emailChanged(email);
                        },
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        placeHolderText: 'Enter email',
                        labelText: 'Email',
                        hintText: '',
                        isValid: !state.email.isNotValid &&
                            state.email.value.isNotEmpty,
                        errorText:
                            state.email.value.isEmpty && _canEmailValidate
                                ? {
                                    'notEnterEmail': ['Enter email', 'error']
                                  }
                                : state.email.isNotValid && _canEmailValidate
                                    ? {
                                        'notEnterEmail': [
                                          'Incorrect email',
                                          'error'
                                        ]
                                      }
                                    : null,
                        iconsList: _canEmailValidate
                            ? const [
                                'assets/icons/close.svg',
                              ]
                            : null,
                        iconAction: MainConstants.cleanIconAction,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.password != current.password,
                    builder: (context, state) {
                      return InputTextComponent(
                        key: const Key('loginForm_passwordInput_textField'),
                        onChanged: (password) {
                          _canPasswordValidate = false;
                          context.read<LoginCubit>().passwordChanged(password);
                        },
                        isObscureText: false,
                        labelText: 'Password',
                        placeHolderText: 'Enter password',
                        isValid: !state.password.isNotValid &&
                            state.password.value.isNotEmpty,
                        errorText: state.password.value.isEmpty &&
                                _canPasswordValidate
                            ? {
                                'notEnterPassword': ['Enter password', 'error']
                              }
                            : state.password.isNotValid && _canPasswordValidate
                                ? {
                                    'incorrectPassword': [
                                      'Incorrect password',
                                      'error'
                                    ]
                                  }
                                : null,
                        iconsList: const [
                          'assets/icons/visibility.svg',
                          'assets/icons/visibility-off.svg'
                        ],
                        iconAction: MainConstants.visibilityIconAction,
                      );
                    },
                  ),
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
                  const ForgotPasswordWidget(),
                  const SizedBox(height: 10),
                  BlocBuilder<LoginCubit, LoginState>(
                    // buildWhen: (previous, current) =>
                    //     previous.status != current.status,
                    builder: (context, state) {
                      return state.status.isInProgress
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF189B8D)))
                          : MainButtonComponent(
                              key: const Key('loginForm_continue_raisedButton'),
                              title: 'Log In',
                              backgroundColor:
                                  ColorConstants.btnPrimaryDefaultColor,
                              titleColor: ColorConstants.textInvertedColor,
                              onPressed: () {
                                setState(() {
                                  if (state.email.isNotValid) {
                                    _canEmailValidate = true;
                                  }
                                  if (state.password.isNotValid) {
                                    _canPasswordValidate = true;
                                  }
                                });
                                FocusManager.instance.primaryFocus?.unfocus();
                                context
                                    .read<LoginCubit>()
                                    .logInWithCredentials();
                              });
                    },
                  ),
                  const SizedBox(height: 12),
                  const DividerComponent(),
                  const SizedBox(height: 12),
                  SignUpButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

