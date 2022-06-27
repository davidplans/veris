import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_schema_health/presentation/bloc/auth_bloc.dart';
import 'package:flutter_schema_health/presentation/bloc/auth_event.dart';
import 'package:flutter_schema_health/presentation/widgets/home_widget.dart';
import 'package:flutter_schema_health/presentation/widgets/progress_widget.dart';
import 'package:flutter_schema_health/presentation/widgets/settings_widget.dart';
import 'package:flutter_schema_health/style/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: const Text('Home'),
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
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.favorite), label: 'Heart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), label: 'My progress'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.perm_identity), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: theme.primaryColor,
        backgroundColor: theme.primaryColorDark,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
      ),
    );
  }
}
