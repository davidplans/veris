import 'package:Veris/common/widgets/ui_components/divider_component.dart';
import 'package:Veris/common/widgets/ui_components/input_text_component.dart';
import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/core/utils/main_constants.dart';
import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/authentication/models/signup_state.dart';
import 'package:Veris/features/authentication/services/signup_cubit.dart';
import 'package:Veris/features/authentication/view/partials/input_protocol_url_widget.dart';
import 'package:Veris/features/authentication/view/partials/qr_code_button.dart';
import 'package:Veris/features/authentication/view/partials/tab_bar_widget.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: const _Form(),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _controller;
  int activeTabIndex = 0;
  int tabLength = 3;
  bool _canEmailValidate = false;
  bool _canPasswordValidate = false;
  bool _canConfirmValidate = false;
  final studyProtocolHelper = StudyProtocolHelper();
  String _studyProtocolUrl = '';

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: tabLength,
      initialIndex: activeTabIndex,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isStateValid(SignUpState state, int index) {
    switch (index) {
      case 0:
        if (state.email.isNotValid) {
          setState(() {
            _canEmailValidate = true;
          });
          return false;
        }
        return true;
      case 1:
        if (state.password.isNotValid || state.confirmedPassword.isNotValid) {
          setState(() {
            _canPasswordValidate = true;
            _canConfirmValidate = true;
          });
          return false;
        }
        return true;
      case 2:
      // if (state.confirmedPassword.isNotValid) {
      //   _canConfirmValidate = true;
      //   return false;
      // }
      // return true;
    }
    return false;
  }

  Map<String, dynamic> _getPasswordErrorMessage(SignUpState state) {
    String password = state.password.value.trim().toString();
    Map<String, dynamic> messages = {
      'eightCharacters': ['8 characters or more', 'error'],
      'lowercaseLetter': ['A lowercase letter', 'error'],
      'uppercaseLetter': ['A uppercase letter', 'error'],
      'numberOrSymbol': ['A number or a symbol', 'error']
    };
    RegExp lowerRegEx = RegExp(r'(?=.*[a-z])\w+');
    RegExp upperRegEx = RegExp(r'(?=.*[A-Z])\w+');
    RegExp numberRegEx = RegExp(r'(?=.*?[0-9])\w+');
    RegExp symbolRegEx = RegExp(r'(?=.*?[!@#\$&*~])');


    if (state.password.value.trim().length >= 8) {
      messages['eightCharacters'][1] = 'succes';
    }
    if (lowerRegEx.hasMatch(password)) {
      messages['lowercaseLetter'][1] = 'succes';
    }
    if (upperRegEx.hasMatch(password)) {
      messages['uppercaseLetter'][1] = 'succes';
    }
    if (numberRegEx.hasMatch(password) || symbolRegEx.hasMatch(password)) {
      messages['numberOrSymbol'][1] = 'succes';
    }
    return messages;
  }

  Map<String, dynamic>? _getConfirmPasswordErrorMessage(SignUpState state) {
    if (state.confirmedPassword.value.isEmpty && _canConfirmValidate) {
      return {
        'notEnterConfirmPassword': ['Enter password to confirm', 'error']
      };
    }
    if (state.confirmedPassword.isNotValid && _canConfirmValidate) {
      return {
        'passwordDoNotMatch': ['Passwords do not match', 'error']
      };
    }
    return null;
  }

  _onSelectedStudyProtocol(BuildContext context, String url) async {
    final res = await studyProtocolHelper.getAndSaveStudyProtocol(context, url);

    if (!res) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red[200],
        content: const Text('URL study protocol is not vslid!'),
      ));
      return;
    }

    // ignore: use_build_context_synchronously
    context.read<SignUpCubit>().signUpFormSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabLength,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TabBarWidget(
                  controller: _controller,
                  tabLength: tabLength,
                  activeTabIndex: activeTabIndex),
              Expanded(
                child: TabBarView(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Column(
                        children: [
                          BlocBuilder<SignUpCubit, SignUpState>(
                            buildWhen: (previous, current) =>
                                previous.email != current.email,
                            builder: (context, state) {
                              return InputTextComponent(
                                key: const Key(
                                    'signUpForm_emailInput_textField'),
                                onChanged: (email) {
                                  _canEmailValidate = false;
                                  context
                                      .read<SignUpCubit>()
                                      .emailChanged(email);
                                },
                                keyboardType: TextInputType.emailAddress,
                                placeHolderText: 'Enter email',
                                labelText: 'Email',
                                hintText: '',
                                errorText:
                                    state.email.isNotValid && _canEmailValidate
                                        ? {
                                            'notEnterEmail': [
                                              'Enter correct email',
                                              'error'
                                            ]
                                          }
                                        : null,
                              );
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Column(
                        children: [
                          BlocBuilder<SignUpCubit, SignUpState>(
                              buildWhen: (previous, current) =>
                                  previous.password != current.password,
                              builder: (context, state) {
                                return InputTextComponent(
                                  key: const Key(
                                      'signUpForm_passwordInput_textField'),
                                  onChanged: (password) {
                                    _canPasswordValidate = false;
                                    _canConfirmValidate = false;
                                    context
                                        .read<SignUpCubit>()
                                        .passwordChanged(password);
                                  },
                                  placeHolderText: 'Enter password',
                                  labelText: 'Password',
                                  hintText: '',
                                  errorText: state.password.isNotValid &&
                                          _canPasswordValidate
                                      ? _getPasswordErrorMessage(state)
                                      : null,
                                  iconsList: const [
                                    'assets/icons/visibility.svg',
                                    'assets/icons/visibility-off.svg'
                                  ],
                                  iconAction:
                                      MainConstants.visibilityIconAction,
                                );
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          BlocBuilder<SignUpCubit, SignUpState>(
                              buildWhen: (previous, current) =>
                                  previous.password != current.password ||
                                  previous.confirmedPassword !=
                                      current.confirmedPassword,
                              builder: (context, state) {
                                return InputTextComponent(
                                  key: const Key(
                                      'signUpForm_confirmedPasswordInput_textField'),
                                  onChanged: (confirmPassword) {
                                    _canConfirmValidate = false;
                                    context
                                        .read<SignUpCubit>()
                                        .confirmedPasswordChanged(
                                            confirmPassword);
                                  },
                                  placeHolderText: 'Reenter password',
                                  labelText: 'Confirm password',
                                  hintText: '',
                                  errorText:
                                      _getConfirmPasswordErrorMessage(state),
                                  iconsList: const [
                                    'assets/icons/visibility.svg',
                                    'assets/icons/visibility-off.svg'
                                  ],
                                  iconAction:
                                      MainConstants.visibilityIconAction,
                                );
                              }),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Column(
                        children: [
                          InputProtocolUrlWidget(
                            onUrlAdded: (url) {
                              setState(() {
                                _studyProtocolUrl = url;
                              });
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: DividerComponent(),
                          ),
                          const QRCodeButton(),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    final nextStepIndex = _controller.index + 1;
                    return MainButtonComponent(
                      title: nextStepIndex == tabLength ? 'Start' : 'Next',
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (nextStepIndex == tabLength) {
                          _onSelectedStudyProtocol(context, _studyProtocolUrl);
                        }
                        final isFormValid =
                            _isStateValid(state, _controller.index);
                        if (isFormValid) {
                          setState(() {
                            activeTabIndex = nextStepIndex;
                            _controller.animateTo(activeTabIndex);
                          });
                        }
                      },
                      backgroundColor: ColorConstants.btnPrimaryDefaultColor,
                      titleColor: ColorConstants.textInvertedColor,
                      sufixIconPath: nextStepIndex == tabLength
                          ? null
                          : 'assets/icons/arrow-forward.svg',
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






