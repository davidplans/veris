import 'dart:convert';

import 'package:Veris/health_app.dart';
import 'package:Veris/presentation/pages/smile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repositories/auth_repository.dart';
import 'questions_widget.dart';
import 'widget_v20.dart';
import 'widget_v31.dart';
import 'widget_v310_trial1.dart';
import 'widget_v318.dart';

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
                  final moduleName = _modules[indexModule]["name"];
                  // print(_modules[indexModule]);
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ExpansionTile(
                      title: Text(moduleName),
                      backgroundColor: Color.fromARGB(255, 100, 155, 200),
                      collapsedBackgroundColor: (() {
                        switch (_modules[indexModule]["type"]) {
                          case "survey":
                            return Colors.blue;
                          case "pat":
                            return Colors.amber[300];
                          case "smile":
                            return Colors.purple[700];
                        }
                      }()),
                      leading: (() {
                        switch (_modules[indexModule]["type"]) {
                          case "survey":
                            return const Icon(Icons.bar_chart,
                                color: Colors.amber);
                          case "pat":
                            return const Icon(Icons.favorite,
                                color: Colors.red);
                          case "smile":
                            return const Icon(Icons.sentiment_satisfied,
                                color: Colors.white);
                        }
                      }()),
                      children: [
                        _modules[indexModule]["type"] == 'survey'
                            ? Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: ListView.builder(
                                  itemCount:
                                      _modules[indexModule]["sections"].length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int indexSection) {
                                    final sectionName = _modules[indexModule]
                                        ["sections"][indexSection]['name'];
                                    return ListTile(
                                      title: Text("Section $sectionName"),
                                      textColor: Colors.white,
                                      iconColor: Colors.white,
                                      trailing: Wrap(
                                        spacing: 12, // space between two icons
                                        children: const <Widget>[
                                          Icon(Icons.arrow_forward), // icon-1
                                          // Icon(Icons.message), // icon-2
                                        ],
                                      ),
                                      onTap: (() async {
                                        List<dynamic> questions =
                                            _modules[indexModule]["sections"]
                                                [indexSection]["questions"];
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                QuestionsWidget(
                                              questions: questions,
                                              moduleId: indexModule,
                                              sectonId: indexSection,
                                              sectionName: sectionName,
                                              moduleName: moduleName,
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              )
                            : _modules[indexModule]["type"] == 'pat'
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: ListTile(
                                      title: const Text("Start test"),
                                      textColor: Colors.white,
                                      iconColor: Colors.white,
                                      trailing: Wrap(
                                        spacing: 12, // space between two icons
                                        children: const <Widget>[
                                          Icon(Icons.arrow_forward), // icon-1
                                          // Icon(Icons.message), // icon-2
                                        ],
                                      ),
                                      onTap: (() async {
                                        await _prefs
                                            .then((SharedPreferences p) {
                                          final studyId =
                                              p.getString('study_id');
                                          final now = DateTime.now()
                                              .microsecondsSinceEpoch;
                                          final String moduleResultID =
                                              '$studyId-$indexModule-$now';

                                          p.setInt(
                                              'maxTrials',
                                              _modules[indexModule]
                                                  ["total_trials"]);
                                          p.setInt(
                                              'stepBodySelect',
                                              _modules[indexModule]
                                                  ["step_body_select"]);
                                          p.setInt('numRuns', 0);
                                          p.setInt('completeTrials', 0);
                                          p.setString('currentModuleResultId',
                                              moduleResultID);
                                          p.setInt('moduleId', indexModule);
                                        }).whenComplete(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    // const V20Widget(),
                                                    const V20Widget()),
                                          );
                                        });
                                      }),
                                    ),
                                  )
                                : _modules[indexModule]["type"] == 'smile'
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: ListTile(
                                          title: const Text("Smile"),
                                          textColor: Colors.white,
                                          iconColor: Colors.white,
                                          trailing: Wrap(
                                            spacing:
                                                12, // space between two icons
                                            children: const <Widget>[
                                              Icon(Icons
                                                  .arrow_forward), // icon-1
                                              // Icon(Icons.message), // icon-2
                                            ],
                                          ),
                                          onTap: (() async {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           const SmilePage()),
                                            // );
                                          }),
                                        ),
                                      )
                                    : Container()
                      ],
                    ),
                  );
                }),
          ),

          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 50,
          //   color: const Color.fromARGB(255, 49, 56, 71),
          //   child: Row(
          //     children: const [
          //       Padding(
          //         padding: EdgeInsets.only(left: 8.0),
          //         child: Text(
          //           '',
          //           style: TextStyle(
          //               color: Colors.white, fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Expanded(
          //   flex: 4,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     color: Colors.white,
          //     child: Column(
          //       children: const [Text('TEXT')],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
