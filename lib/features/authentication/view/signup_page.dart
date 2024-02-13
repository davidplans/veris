import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/common/widgets/ui_components/divider_component.dart';
import 'package:Veris/common/widgets/ui_components/input_text_component.dart';
import 'package:Veris/common/widgets/ui_components/outline_button_component.dart';
import 'package:Veris/core/utils/main_constants.dart';
import 'package:Veris/features/authentication/models/signup_state.dart';
import 'package:Veris/features/authentication/services/signup_cubit.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/core/user/auth_repository.dart';
import 'package:Veris/features/authentication/view/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Enter your email'),
      body: BlocProvider<SignUpCubit>(
        create: (_) => SignUpCubit(context.read<AuthenticationRepository>()),
        child: const _SignUpForm(),
      ),
    );
  }
}

class _SignUpForm extends StatefulWidget {
  const _SignUpForm();

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _controller;
  int activeTabIndex = 0;
  int tabLength = 3;
  bool _canEmailValidate = false;
  bool _canPasswordValidate = false;
  bool _canConfirmValidate = false;

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: tabLength,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TabBar(
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
              ),
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
                          BlocBuilder<SignUpCubit, SignUpState>(
                              buildWhen: (previous, current) =>
                                  previous.password != current.password ||
                                  previous.confirmedPassword !=
                                      current.confirmedPassword,
                              builder: (context, state) {
                                return InputTextComponent(
                                  onChanged: (text) {},
                                  keyboardType: TextInputType.emailAddress,
                                  placeHolderText: 'Enter protocol URL',
                                  labelText: 'Study protocol URL',
                                  hintText: '',
                                  isValid: true,
                                  errorText: null,
                                );
                              }),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: DividerComponent(),
                          ),
                          OutlinedButtonComponent(
                            title: 'Scan QR code',
                            onPressed: () {},
                            backgroundColor:
                                ColorConstants.btnOutlineDefaultColor,
                            titleColor: ColorConstants.btnPrimaryDefaultColor,
                            borderColor: ColorConstants.btnOutlineBoarderColor,
                          ),
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
                      title: (nextStepIndex) == tabLength
                          ? 'Start'
                          : 'Next',
                      onPressed: () {
                        
                        if (_controller.index + 1 == tabLength) return;
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
