import 'package:flutter/material.dart';

import 'app_bar_widget.dart';
import 'baseline_page.dart';

class GetReadyPage extends StatelessWidget {
  const GetReadyPage({super.key});

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
                  // child: const Text("Back", style: TextStyle(color: Colors.white),),
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
                  // child: const Text("Back", style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BaselinePage(),
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
              children: [
                Image.asset(
                  'assets/images/hand.png',
                  width: 200,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "Getting ready to check your heartbeat.",
                  style: TextStyle(fontSize: 28.0),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  textAlign: TextAlign.center,
                  "We will shortly turn on the LED Flash and camera on this phone, and will use it to take your heart rate. Please place your index finger across both camera and flash.",
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
        ));
  }
}
