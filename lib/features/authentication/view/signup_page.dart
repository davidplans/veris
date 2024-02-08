import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/common/widgets/ui_components/main_button_component.dart';
import 'package:Veris/common/widgets/ui_components/divider_component.dart';
import 'package:Veris/common/widgets/ui_components/input_text_component.dart';
import 'package:Veris/common/widgets/ui_components/outline_button.dart';
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
  late TabController _controller;
  int activeTabIndex = 0;
  int tabLength = 3;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: tabLength,
      initialIndex: activeTabIndex,
      vsync: this,
    );
    print('ACTIVETABINDEX: ${activeTabIndex}');
    // _controller.addListener(() {
    //   setState(() {
    //     activeTabIndex = _controller.index;
    //   });
    // });
    // print('ACTIVETABINDEX2: ${activeTabIndex}');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: tabLength,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                        InputTextComponent(
                          onChanged: (text) {},
                          keyboardType: TextInputType.emailAddress,
                          placeHolderText: 'Enter email',
                          labelText: 'Email',
                          hintText: '',
                          isValid: true,
                          errorText: null,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        InputTextComponent(
                          onChanged: (text) {},
                          keyboardType: TextInputType.emailAddress,
                          placeHolderText: 'Enter password',
                          labelText: 'Password',
                          hintText: '',
                          isValid: true,
                          errorText: null,
                          iconsList: const [
                            'assets/icons/visibility.svg',
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        InputTextComponent(
                          onChanged: (text) {},
                          keyboardType: TextInputType.emailAddress,
                          placeHolderText: 'Reenter password',
                          labelText: 'Confirm password',
                          hintText: '',
                          isValid: true,
                          errorText: null,
                          iconsList: const [
                            'assets/icons/visibility.svg',
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        InputTextComponent(
                          onChanged: (text) {},
                          keyboardType: TextInputType.emailAddress,
                          placeHolderText: 'Enter protocol URL',
                          labelText: 'Study protocol URL',
                          hintText: '',
                          isValid: true,
                          errorText: null,
                        ),
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
              child: MainButtonComponent(
                title: (_controller.index + 1) == tabLength ? 'Start' : 'Next',
                onPressed: () {
                  activeTabIndex = (_controller.index + 1);
                  if ((_controller.index + 1) == tabLength) return;
                  setState(() {
                    _controller.animateTo(activeTabIndex);
                  });
                },
                backgroundColor: ColorConstants.btnPrimaryDefaultColor,
                titleColor: ColorConstants.textInvertedColor,
                sufixIconPath: (_controller.index + 1) == tabLength ? null : 'assets/icons/arrow-forward.svg',
              ),
            )
          ],
        ),
      ),
    );
  }
}
