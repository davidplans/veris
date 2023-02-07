import 'dart:convert';

import 'package:Veris/app.dart';
import 'package:Veris/features/home/view/partials/module_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/user/auth_repository.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // List<FileSystemEntity> _files = [];
  List<dynamic> _modules = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _bannerUrl = '';

  @override
  initState() {
    getFile();

    super.initState();
  }

  Future<void> getFile() async {
    _prefs.then((SharedPreferences p) {
      Map parsedJson = jsonDecode(p.getString('json_file') ?? '');
      Map<String, dynamic> prop = parsedJson['properties'];

      p.setString('study_name', prop['study_name']);
      p.setString('study_id', prop['study_id']);
      p.setString('created_by', prop['created_by']);
      p.setString('instructions', prop['instructions']);
      p.setString('empty_msg', prop['empty_msg']);
      p.setString('support_url', prop['support_url']);
      p.setString('support_email', prop['support_email']);
      p.setString('ethics', prop['ethics']);
      p.setString('pls', prop['pls']);

      setState(() {
        _modules = List.from((parsedJson['modules']));
        _bannerUrl = prop['banner_url'] ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    // final user = context.select((AuthBloc bloc) => bloc.state.user);

    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _bannerUrl != "" ? Image.network(_bannerUrl) : Container(),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: const Color.fromARGB(255, 49, 56, 71),
              child: Row(children: [
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      '',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          final authenticationRepository =
                              AuthenticationRepository();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HealthApp(
                                      authenticationRepository:
                                          authenticationRepository,
                                    )),
                          );
                        },
                        child: const Text('Use other JSON')))
              ])),
          Expanded(
            flex: 4,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _modules.length,
                itemBuilder: (BuildContext context, int indexModule) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ModuleWidget(
                        module: _modules[indexModule],
                        indexModule: indexModule,
                        prefs: _prefs),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
