import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/settings/view/settings_widget.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/features/authentication/bloc/auth_event.dart';
import 'package:Veris/features/home/view/home_widget.dart';
import 'package:Veris/features/my_progress/view/progress_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final studyProtocolHelper = StudyProtocolHelper();
  int _currentIndex = 0;
  Size navBarIconSise = const Size(28.0, 28.0);
  String homeIconPath = 'assets/icons/home.svg';
  String progressIconPath = 'assets/icons/moving.svg';
  String settingsIconPath = 'assets/icons/settings.svg';

  final pages = [
    const HomeWidget(),
    const ProgressWidget(),
    const SettingsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Veris'),
      //   automaticallyImplyLeading: false,
      //   actions: <Widget>[
      //     IconButton(
      //       key: const Key('homePage_logout_iconButton'),
      //       icon: const Icon(Icons.exit_to_app),
      //       onPressed: () async {
      //         await studyProtocolHelper.cleanInfoAboutCurrentStudyProtocol();
      //         // ignore: use_build_context_synchronously
      //         context.read<AuthBloc>().add(AuthenticationLogoutRequested());
      //       },
      //     )
      //   ],
      // ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                homeIconPath,
                width: navBarIconSise.width,
                height: navBarIconSise.height,
              ),
              activeIcon: SvgPicture.asset(
                homeIconPath,
                width: navBarIconSise.width,
                height: navBarIconSise.height,
                colorFilter: const ColorFilter.mode(
                    ColorConstants.iconSecondaryColor, BlendMode.srcIn),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                progressIconPath,
                width: navBarIconSise.width,
                height: navBarIconSise.height,
              ),
              activeIcon: SvgPicture.asset(
                progressIconPath,
                width: navBarIconSise.width,
                height: navBarIconSise.height,
                colorFilter: const ColorFilter.mode(
                    ColorConstants.iconSecondaryColor, BlendMode.srcIn),
              ),
              label: 'My progress'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                settingsIconPath,
                width: navBarIconSise.width,
                height: navBarIconSise.height,
              ),
              activeIcon: SvgPicture.asset(
                settingsIconPath,
                width: navBarIconSise.width,
                height: navBarIconSise.height,
                colorFilter: const ColorFilter.mode(
                    ColorConstants.iconSecondaryColor, BlendMode.srcIn),
              ),
              label: 'Settings'),
        ],
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
      ),
    );
  }
}
