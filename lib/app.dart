import 'package:Veris/core/utils/image_constant.dart';
import 'package:Veris/routes/routes.dart';
import 'package:Veris/utils/download_json.dart';
import 'package:Veris/features/qr_scanner/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/core/user/auth_repository.dart';
import 'package:Veris/features/authentication/bloc/auth_bloc.dart';
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
      routes: routesConfig,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                SizedBox(
                    height: 70.0,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageConstant.imgBase,
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
                ImageConstant.imgDarkCircle,
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
              const SizedBox(
                  width: 300,
                  child: Text(
                    "Welcome to VERIS - a platform to participate in research surveys directly from your smartphone.",
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
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.black),
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
