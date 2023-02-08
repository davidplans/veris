import 'package:Veris/features/authentication/view/auth_view.dart';
import 'package:Veris/features/intro/view/partials/intro_go_to_qr_button.dart';
import 'package:Veris/features/intro/view/partials/intro_info.dart';
import 'package:Veris/features/intro/view/partials/intro_mode_switch.dart';
import 'package:Veris/features/intro/view/partials/intro_top_bar.dart';
import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  TextEditingController _controller = TextEditingController();

  String testURL =
      'https://firebasestorage.googleapis.com/v0/b/patdeployments.appspot.com/o/veris_test.json?alt=media&token=62344c9d-3d54-4a35-9ae6-8db9e867b43b';
  bool expanded = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onSelectedStudyProtocol(BuildContext context) async {
    final res = await StudyProtocolHelper.saveStudyProtocol(
        context, _controller.value.text);

    if (!res) {
      return;
    }

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AuthView()),
    );
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
              const IntroTopBar(),
              const IntroInfo(),
              IntroGoToQRButton(expanded: expanded),
              const SizedBox(height: 30),
              IntroModeSwitch(
                expanded: expanded,
                onChanged: (val) => {
                  setState(() {
                    expanded = val;
                  })
                },
              ),
              const SizedBox(height: 30),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: expanded ? 250 : 0,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        keyboardType: TextInputType.url,
                        decoration: const InputDecoration(
                            labelText: 'Study protocol URL',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.all(8.0)),
                        onChanged: ((value) {
                          setState(() {
                            _controller.text = value;
                          });
                        }),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => {_onSelectedStudyProtocol(context)},
                        child: const Text("Start"),
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
                            duration: const Duration(seconds: 2),
                          ));
                        },
                        child: const Text(
                          "Use Demo protocol",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
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
