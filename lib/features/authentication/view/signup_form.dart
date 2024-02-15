import 'package:Veris/common/widgets/ui_components/divider_component.dart';
import 'package:Veris/common/widgets/ui_components/input_text_component.dart';
import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/common/widgets/ui_components/outline_button_component.dart';
import 'package:Veris/core/utils/main_constants.dart';
import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/authentication/models/signup_state.dart';
import 'package:Veris/features/authentication/services/signup_cubit.dart';
import 'package:Veris/features/qr_scanner/qr_scanner.dart';
import 'package:Veris/routes/routes.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

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
        // context.read<SignUpCubit>().signUpFormSubmitted();
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
    Map<String, dynamic> messages = {
      'eightCharacters': ['8 characters or more', 'error'],
      'lowercaseLetter': ['A lowercase letter', 'error'],
      'numberOrSymbol': ['A number or a symbol', 'error']
    };
    if (state.password.value.trim().length >= 8) {
      messages['eightCharacters'][1] = 'succes';
    }
    // if (state.email.value.trim().length >= 8) {
    //   messages['eightCharacters'][1] = 'succes';
    // }
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
      return;
    }

    // ignore: use_build_context_synchronously
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const AuthView()),
    // );
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
              _TabBar(
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
                          _IntroWidget(
                            onUrlAdded: (url) {
                              _onSelectedStudyProtocol(context, url);
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: DividerComponent(),
                          ),
                          const _QRCodeButton(),
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
                      title: (nextStepIndex) == tabLength ? 'Start' : 'Next',
                      onPressed: () {
                        if (nextStepIndex == tabLength) return;
                        final isFormValid =
                            _isStateValid(state, _controller.index);
                        if (isFormValid) {
                          setState(() {
                            activeTabIndex = nextStepIndex;
                            _controller.animateTo(activeTabIndex);
                          });
                          // context.read<SignUpCubit>().signUpFormSubmitted();
                        }
                      },
                      backgroundColor: ColorConstants.btnPrimaryDefaultColor,
                      titleColor: ColorConstants.textInvertedColor,
                      sufixIconPath: (_controller.index + 1) == tabLength
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

class _QRCodeButton extends StatelessWidget {
  const _QRCodeButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButtonComponent(
      title: 'Scan QR code',
      onPressed: () {
        context.go(Routes.scanQR.path);
      },
      backgroundColor: ColorConstants.btnOutlineDefaultColor,
      titleColor: ColorConstants.btnPrimaryDefaultColor,
      borderColor: ColorConstants.btnOutlineBoarderColor,
    );
  }
}

class _IntroWidget extends StatefulWidget {
  final ValueChanged<String> onUrlAdded;
  const _IntroWidget({required this.onUrlAdded});

  @override
  State<_IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<_IntroWidget> {
  final TextEditingController _controller = TextEditingController(
      text:
          'https://firebasestorage.googleapis.com/v0/b/patdeployments.appspot.com/o/veris_test_2.json?alt=media&token=80d0dfa5-8720-4449-bbf0-cf630189768f');
  final studyProtocolHelper = StudyProtocolHelper();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InputTextComponent(
      controller: _controller,
      onChanged: (text) {
        widget.onUrlAdded(text);
      },
      keyboardType: TextInputType.url,
      placeHolderText: 'Enter protocol URL',
      labelText: 'Study protocol URL',
      hintText: '',
      errorText: null,
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({
    required TabController controller,
    required this.tabLength,
    required this.activeTabIndex,
  }) : _controller = controller;

  final TabController _controller;
  final int tabLength;
  final int activeTabIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TabBar(
      labelPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      indicatorColor: Colors.transparent,
      controller: _controller,
      dividerHeight: 0,
      indicatorWeight: 0.1,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(
          height: 4,
          child: Container(
            width: width / tabLength,
            decoration: BoxDecoration(
              color: activeTabIndex == 0
                  ? ColorConstants.progressBarPrimaryColor
                  : ColorConstants.separatorPrimaryColor,
            ),
          ),
        ),
        Tab(
          height: 4,
          child: Container(
            width: width / tabLength,
            decoration: BoxDecoration(
              color: activeTabIndex == 1
                  ? ColorConstants.progressBarPrimaryColor
                  : ColorConstants.separatorPrimaryColor,
            ),
          ),
        ),
        Tab(
          height: 4,
          child: Container(
            width: width / tabLength,
            decoration: BoxDecoration(
              color: activeTabIndex == 2
                  ? ColorConstants.progressBarPrimaryColor
                  : ColorConstants.separatorPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
