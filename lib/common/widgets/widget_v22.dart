import 'package:flutter/material.dart';

import 'widget_v23.dart';


class V22Widget extends StatefulWidget {
  const V22Widget({super.key});

  @override
  State<V22Widget> createState() => _V22WidgetState();
}

class _V22WidgetState extends State<V22Widget> {
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
                        builder: (context) => const V23Widget(),
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
              children:  [
                Image.asset('assets/images/hand.png', width: 200,),
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
