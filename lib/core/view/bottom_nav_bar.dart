import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/settings/view/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/features/authentication/bloc/auth_event.dart';
import 'package:Veris/features/home/view/home_widget.dart';
import 'package:Veris/features/my_progress/view/progress_widget.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: BottomNavBar());

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final studyProtocolHelper = StudyProtocolHelper();
  int _currentIndex = 0;

  final pages = [
    const HomeWidget(),
    const ProgressWidget(),
    const SettingsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veris'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              await studyProtocolHelper.cleanInfoAboutCurrentStudyProtocol();
              // ignore: use_build_context_synchronously
              context.read<AuthBloc>().add(AppLogoutRequested());
            },
          )
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), label: 'My progress'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.amber,
        backgroundColor: const Color(0XFF0F2042),
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
      ),
    );
  }
}
