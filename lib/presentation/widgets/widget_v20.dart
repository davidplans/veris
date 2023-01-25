import 'package:Veris/presentation/pages/trial_page.dart';
import 'package:Veris/presentation/widgets/widget_v21.dart';
import 'package:flutter/material.dart';


class V20Widget extends StatefulWidget {
  const V20Widget({super.key});

  @override
  State<V20Widget> createState() => _V20WidgetState();
}

class _V20WidgetState extends State<V20Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Veris'),
          automaticallyImplyLeading: false
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 1,
                child: FloatingActionButton.extended(
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  backgroundColor: const Color(0XFF0F2042),
                  // child: const Text("Back", style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TrialPage(),
                      ),
                    );
                  },
                  label: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: const [
                SizedBox(
                  height: 200.0,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "How well can you match a sound with your heartbeat?\n\nLet’s find out!",
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
        ));
  }
}
