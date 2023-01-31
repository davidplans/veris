import 'package:flutter/material.dart';

import 'widget_v34.dart';

class V33Widget extends StatefulWidget {
  const V33Widget({super.key});

  @override
  State<V33Widget> createState() => _V33WidgetState();
}

class _V33WidgetState extends State<V33Widget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Veris'), automaticallyImplyLeading: false),
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
                      builder: (context) => const V34Widget(),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: const Text(
                      textAlign: TextAlign.center,
                      "Your objective is to find the point on the dial where the heartbeat and sound is in sync, by turning the dial left or right.",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                
              ],
            ),
          ),
    );
  }
}