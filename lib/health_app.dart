import 'package:Veris/presentation/utils/download_json.dart';
import 'package:Veris/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/data/repositories/auth_repository.dart';
import 'package:Veris/presentation/bloc/auth_bloc.dart';
import 'package:Veris/style/theme.dart';

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
  TextEditingController _controller = TextEditingController();

  String testURL =
      'https://firebasestorage.googleapis.com/v0/b/patdeployments.appspot.com/o/veris_test.json?alt=media&token=62344c9d-3d54-4a35-9ae6-8db9e867b43b';
  bool expanded = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = TextEditingController();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Future<void> _downloadFile(String url) async {
  //   Dio dio = Dio();
  //   final String unixTime = (DateTime.now().millisecondsSinceEpoch).toString();
  //   final String nameFromId;
  //   try {
  //     var dir = await getApplicationDocumentsDirectory();
  //     await dio.download(url, "${dir.path}/$unixTime.json",
  //         options: Options(
  //           responseType: ResponseType.json,
  //         ), onReceiveProgress: (rec, total) async {
  //       // setState(() {
  //       //   downloading = true;
  //       //   progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
  //       // });
  //     });
  //     final localFile = File("${dir.path}/$unixTime.json");
  //     try {
  //       final json = await localFile.readAsString();
  //       final decodingFile = jsonDecode(json);
  //       nameFromId = decodingFile["properties"]["study_id"];
  //       var path = localFile.path;
  //       var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
  //       var newPath =
  //           path.substring(0, lastSeparator + 1) + nameFromId + ".json";
  //       localFile.rename(newPath).whenComplete(() => {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => const AuthView()),
  //             ),
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               SnackBar(
  //                 backgroundColor: Colors.green[200],
  //                 content: const Text("JSON file uploaded successfully!"),
  //               ),
  //             )
  //           });
  //     } catch (error) {
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: const Text('Error file type!'),
  //             content: const Text("Downloading file is not json!"),
  //             actions: [
  //               TextButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: const Text('Try again'))
  //             ],
  //           );
  //         },
  //       );
  //       localFile.delete();
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: const Text('Link error!'),
  //             content: const Text("Study json file not found!"),
  //             actions: [
  //               TextButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: const Text('Try again'))
  //             ],
  //           );
  //         },
  //       );
  //     }
  //   }

  //   // setState(() {
  //   //   downloading = false;
  //   //   progressString = "Completed";
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 80.0,
                  width: MediaQuery.of(context).size.width,
                  color: const Color.fromARGB(255, 15, 32, 66),
                ),
                Container(
                    height: 70.0,
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
                height: 20,
              ),
              Image.asset(
                'assets/images/dark_circle.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Lets get started",
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: 300,
                  child: const Text(
                    "Welcome to VERIS - a platform to participate in research suveys directly from your smartphone.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: !expanded ? 120 : 0,
                child: Container(
                  height: 15,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text('Scan QR'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QrScanner()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                    label: Text(!expanded ? 'Enter URL' : 'Scan QR',
                        style: const TextStyle(color: Colors.white)),
                    backgroundColor: const Color.fromARGB(255, 15, 32, 66),
                    icon: Icon(
                        color: Colors.white,
                        expanded ? Icons.arrow_upward : Icons.arrow_downward),
                    onPressed: () => setState(() {
                      expanded = !expanded;
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: expanded ? 250 : 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          labelText: 'Enter JSON file url',
                          fillColor: Colors.white,
                          filled: true,
                          // use the getter variable defined above
                          // errorText: _errorText,
                        ),
                        onChanged: ((value) {
                          setState(() {
                            _controller.text = value;
                          });
                        }),
                      ),
                      ElevatedButton(
                        onPressed: _controller.value.text.isNotEmpty
                            ? () {
                                DownladJSON().downloadFile(
                                    _controller.value.text, context);
                              }
                            : null,
                        child: const Text("Enrol"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _controller = TextEditingController(text: testURL);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green[200],
                            content: const Text('Pasted!'),
                          ));
                        },
                        child: const Text(
                          "Paste test URL",
                          style: TextStyle(color: Colors.amber, fontSize: 22),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        testURL,
                        style:
                            const TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
