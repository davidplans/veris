import 'package:flutter/material.dart';

import 'app_bar_widget.dart';
import 'widget_v39.dart';

class V38Widget extends StatefulWidget {
  const V38Widget({super.key});

  @override
  State<V38Widget> createState() => _V38WidgetState();
}

class _V38WidgetState extends State<V38Widget> {

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
                      builder: (context) => const V39Widget(),
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
                      "For the duration of this task, please do not actively try to feel your pulse with your hand; we are only interested in what you feel! You might feel your heartbeat in various bodily locations. Just make sure you pick one and stick to using that one during the task.\n\nWhen you are ready to start, please sit comfortably upright with your earphones on and press “Сontinue”.",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),

                
              ],
            ),
          ),
    );
  }
}
