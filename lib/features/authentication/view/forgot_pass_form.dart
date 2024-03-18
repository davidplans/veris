import 'package:Veris/common/widgets/ui_components/input_text_component.dart';
import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/features/authentication/models/forgot_pass_state.dart';
import 'package:Veris/features/authentication/services/forgot_pass_cubit.dart';
import 'package:Veris/routes/routes.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    super.key,
  });

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  bool _canEmailValidate = false;
  bool _isEmailSent = false;

  Widget _checkYourEmail() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
          child: SvgPicture.asset(
            'assets/icons/illustrations/email.svg',
            colorFilter: const ColorFilter.mode(
                ColorConstants.iconSecondaryColor, BlendMode.srcIn),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Text(
            'Check your email',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorConstants.textPrimaryColor,
                fontFamily: FontConstants.interFontFamily,
                fontSize: FontConstants.fontSize24,
                fontWeight: FontWeight.w500,
                height: 1.333),
          ),
        ),
        const Text(
          'We sent you an email to name@email.com with a reset link. Once you reset your password proceed to log in.',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorConstants.textSecondaryColor,
              fontFamily: FontConstants.interFontFamily,
              fontSize: FontConstants.fontSize16,
              fontWeight: FontWeight.w400,
              height: 1.375),
        ),
      ],
    );
  }

  void _resetPassword(ForgotPasswordState state) {
    setState(() {
      if (state.email.isNotValid) {
        _canEmailValidate = true;
      }
    });
    context.read<ForgotPasswordCubit>().resetPassword();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              backgroundColor: Colors.green[200],
              content: const Text('Password reset email sent!'),
              duration: const Duration(seconds: 3),
            ));
          setState(() {
            _isEmailSent = true;
          });
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              backgroundColor: Colors.red[200],
              content: const Text('Reset Password Failure!'),
              duration: const Duration(seconds: 4),
            ));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 40.0),
        child: Column(
          children: [
            _isEmailSent
                ? _checkYourEmail()
                : Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                        child: Text(
                          'Forgot password',
                          style: TextStyle(
                              fontFamily: FontConstants.interFontFamily,
                              fontSize: FontConstants.fontSize24,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.textPrimaryColor,
                              height: 1.25),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          'Enter email associated with Veris account and the reset link will be send',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: FontConstants.interFontFamily,
                              fontSize: FontConstants.fontSize16,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.textSecondaryColor,
                              height: 1.25),
                        ),
                      ),
                      BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                          buildWhen: (previous, current) =>
                              previous.email != current.email,
                          builder: ((context, state) {
                            return InputTextComponent(
                              keyboardType: TextInputType.emailAddress,
                              placeHolderText: 'Enter email',
                              labelText: 'Email',
                              hintText: '',
                              errorText:
                                  state.email.isNotValid && _canEmailValidate
                                      ? {
                                          'notEnterEmail': [
                                            'Please enter a valid email',
                                            'error'
                                          ]
                                        }
                                      : null,
                              onChanged: (email) {
                                _canEmailValidate = false;
                                context
                                    .read<ForgotPasswordCubit>()
                                    .emailChanged(email);
                              },
                            );
                          })),
                    ],
                  ),
            const Spacer(),
            BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                return state.status.isInProgress
                    ? const CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.black54),
                      )
                    : MainButtonComponent(
                        title: _isEmailSent
                            ? 'Return to log in'
                            : 'Reset password',
                        onPressed: () {
                          _isEmailSent
                              ? context.go(Routes.login.path)
                              : _resetPassword(state);
                        },
                        backgroundColor: ColorConstants.btnPrimaryDefaultColor,
                        titleColor: ColorConstants.textInvertedColor);
              },
            )
          ],
        ),
      ),
    );
  }
}
