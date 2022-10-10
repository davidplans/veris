import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/data/repositories/auth_repository.dart';
import 'package:Veris/presentation/bloc/auth_bloc.dart';
import 'package:Veris/presentation/bloc/auth_state.dart';
import 'package:Veris/presentation/routes/routes.dart';
import 'package:Veris/style/theme.dart';
import 'package:path_provider/path_provider.dart';

class HealthApp extends StatelessWidget {
  const HealthApp({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) =>
            AuthBloc(authenticationRepository: _authenticationRepository),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const StudyView(),
    );
  }
}

class StudyView extends StatefulWidget {
  const StudyView({Key? key}) : super(key: key);

  @override
  State<StudyView> createState() => _StudyViewState();
}

class _StudyViewState extends State<StudyView> {
  late TextEditingController _controller;
  bool downloading = false;
  var progressString = "";
  String testURL =
      'https://firebasestorage.googleapis.com/v0/b/patdeployments.appspot.com/o/veris_test.json?alt=media&token=8015e8c0-a2e6-4f97-b147-c331af29ba02';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _downloadFile(String url) async {
    Dio dio = Dio();
    final String unixTime = (DateTime.now().millisecondsSinceEpoch).toString();
    final String nameFromId;
    try {
      var dir = await getApplicationDocumentsDirectory();
      await dio.download(url, "${dir.path}/$unixTime.json",
          options: Options(
            responseType: ResponseType.json,
          ), onReceiveProgress: (rec, total) async {
        print("Rec: $rec , Total: $total");

        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
      final localFile = File("${dir.path}/$unixTime.json");
      print(dir.path);
      try {
        final json = await localFile.readAsString();
        final decodingFile = jsonDecode(json);
        nameFromId = decodingFile["properties"]["study_id"];
        var path = localFile.path;
        var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
        var newPath =
            path.substring(0, lastSeparator + 1) + nameFromId + ".json";
        final rename = localFile.rename(newPath);
      } catch (error) {
        print(error);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error file type!'),
              content: const Text("Downloading file is not json!"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Try again'))
              ],
            );
          },
        );
        localFile.delete();
      }

      // if (nameFromId == null) {
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: const Text('Error file type!'),
      //         content: const Text("Downloading file is not json!"),
      //         actions: [
      //           TextButton(
      //               onPressed: () {
      //                 Navigator.of(context).pop();
      //               },
      //               child: Text('Try again'))
      //         ],
      //       );
      //     },
      //   );
      //   localFile.delete();
      // } else {
      //   var path = localFile.path;
      //   var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
      //   var newPath =
      //       path.substring(0, lastSeparator + 1) + nameFromId + ".json";
      //   final rename = localFile.rename(newPath);
      // }

    } catch (e) {
      if (e is DioError) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Link error!'),
              content: const Text("Study json file not found!"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Try again'))
              ],
            );
          },
        );
      }
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Stack(children: [
                  Container(
                    height: 100.0,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(255, 15, 32, 66),
                  ),
                  Container(
                      height: 80.0,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon.png',
                                width: 20,
                              ),
                              const Text(
                                "  VERIS",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )))
                ]),
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/dark_circle.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Lets get started",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: 300,
                    child: const Text(
                      "Welcome to schema - a platform to participate in research suveys directly from your smartphone.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Enter json file url',
                    fillColor: Colors.white,
                    // use the getter variable defined above
                    // errorText: _errorText,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {
                    _controller.value.text.isNotEmpty
                        ? _downloadFile(_controller.value.text)
                        : null,
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthView()),
                    ),
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("JSON file uploaded successfully!"),
                      ),
                    )
                  },
                  child: const Text("Download"),
                ),

                SizedBox(height: 30,),
                    InkWell(
        onTap: () {
          Clipboard.setData(
            ClipboardData(
              text: testURL,
            ),
          );
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
        },
        child: Text("Copy test URL", style: TextStyle(color: Colors.amber, fontSize: 22),),
      ),
SizedBox(height: 20,),
                Text(
                  testURL,
                  style: const TextStyle( fontSize: 14.0),
                ),
              ],
            ),
          ),
        ));
  }
}

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AuthStatus>(
      state: context.select((AuthBloc bloc) => bloc.state.status),
      onGeneratePages: onGenerateAppViewPages,
    );
  }
}
