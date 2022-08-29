import 'package:Veris/presentation/widgets/surveys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/presentation/bloc/auth_bloc.dart';
import 'package:Veris/presentation/bloc/auth_event.dart';
import 'package:Veris/presentation/widgets/home_widget.dart';
import 'package:Veris/presentation/widgets/progress_widget.dart';
import 'package:Veris/presentation/widgets/heart_beats_widget.dart';
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
    const SurveysWidget(),
    const IntroTabWidget(),
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
          BottomNavigationBarItem(
               icon: Icon(Icons.bar_chart), label: 'Survey'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Heart Beat'),
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
