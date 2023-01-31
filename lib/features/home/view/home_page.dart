import 'package:Veris/features/settings/view/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
import 'package:Veris/features/authentication/bloc/auth_event.dart';
import 'package:Veris/features/home/view/home_widget.dart';
import 'package:Veris/features/my_progress/view/progress_widget.dart';
import 'package:Veris/style/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final pages = [
    const HomeWidget(),
    const ProgressWidget(),
    // const SurveysWidget(),
    // const IntroTabWidget(),
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
            onPressed: () => context.read<AuthBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.favorite), label: 'Heart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), label: 'My progress'),
          // BottomNavigationBarItem(
          //      icon: Icon(Icons.bar_chart), label: 'Survey'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.favorite), label: 'Heart Beat'),
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
