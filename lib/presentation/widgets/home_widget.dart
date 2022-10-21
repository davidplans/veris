import 'dart:convert';
import 'dart:io';

import 'package:Veris/health_app.dart';
import 'package:Veris/presentation/widgets/heart_beats_widget.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/auth_repository.dart';
import 'questions_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<FileSystemEntity> _files = [];
  List<dynamic> _modules = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  initState() {
    getFile();

    super.initState();
  }

  Future<void> getFile() async {
    await _prefs.then((SharedPreferences p) {
      Map parsedJson = jsonDecode(p.getString('json_file') ?? '');

      setState(() {
        _modules = List.from((parsedJson['modules']));
      });

      // print(_modules[0]);
    });

    // final directory = await getApplicationDocumentsDirectory();
    // // directory.delete();
    // final dir = directory.path;
    // String docDirectory = '$dir/';
    // final docDir = Directory(docDirectory);
    // // docDir.deleteSync(recursive: false);

    // setState(() {
    //   _files = docDir.listSync(recursive: true, followLinks: false);
    // });
    // final Iterable<File> files = _files.whereType<File>();
    // for (File file in files) {
    //   String fileName = file.path.split('/').last;
    //   if (fileName.contains('.json') || fileName.contains('.JSON')) {
    //     var json = await file.readAsString();
    //     final decodingFile = jsonDecode(json);

    //     _jsonFiles.add(decodingFile);

    //   }
    //   setState(() {});
    // }
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
                      'Recent',
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
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ListTile(
                        trailing: Wrap(
                          spacing: 12, // space between two icons
                          children: const <Widget>[
                            Icon(Icons.arrow_forward), // icon-1
                            // Icon(Icons.message), // icon-2
                          ],
                        ),
                        leading: _modules[index]["type"] == 'survey'
                            ? const Icon(Icons.bar_chart, color: Colors.amber)
                            : const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        // subtitle:
                        //     Text(countId.toString()),
                        title: Text(_modules[index]["name"]),
                        tileColor: _modules[index]["type"] == 'survey'
                            ? Colors.blue
                            : Colors.amber[300],
                        onTap: (() async {
                          if (_modules[index]["type"] == 'survey') {
                            List<dynamic> questions =
                                _modules[index]["sections"][0]["questions"];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionsWidget(
                                  questions: questions,
                                  moduleId: index,
                                ),
                              ),
                            );
                          } else if (_modules[index]["type"] == 'pat') {
                            await _prefs.then((SharedPreferences p) {
                              p.setInt(
                                  'maxTrials', _modules[index]["total_trials"]);
                              p.setInt('stepBodySelect',
                                  _modules[index]["step_body_select"]);
                            }).whenComplete(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const IntroTabWidget(),
                                ),
                              );
                            });
                          }
                        }),
                      ),
                    );
                  })),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: const Color.fromARGB(255, 49, 56, 71),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Start here',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: const [Text('TEXT')],
              ),
            ),
          ),

          // Avatar(photo: user.photo),
          // const SizedBox(height: 4),
          // Text(user.email ?? '', style: textTheme.headline6),
          // const SizedBox(height: 4),
          // Text(user.name ?? '', style: textTheme.headline5),
        ],
      ),
    );
  }
}
