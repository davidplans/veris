import 'package:flutter/material.dart';

import 'app_bar_widget.dart';
import 'widget_v310_trial1.dart';

class V39Widget extends StatefulWidget {
  const V39Widget({super.key});

  @override
  State<V39Widget> createState() => _V39WidgetState();
}

class _V39WidgetState extends State<V39Widget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Veris"),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: FloatingActionButton.extended(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                backgroundColor: const Color(0XFF0F2042),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                label: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
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
                onPressed: () {
                                        Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const V310Trial1Widget(),
                      ),
                    );
                },
                label: const Text(
                  "Continue",
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
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: const Text(
                      textAlign: TextAlign.center,
                      "You will now get a chance to do two practice trials.\n\nFocus on feeling your heartbeat and try to match the sounds to your own heartbeat.",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),

                
              ],
            ),
          ),
    );
  }
}
