import 'package:Veris/features/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'app_bar_widget.dart';
import 'widget_v22.dart';

class V318Widget extends StatefulWidget {
  const V318Widget({super.key});

  @override
  State<V318Widget> createState() => _V318WidgetState();
}

class _V318WidgetState extends State<V318Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: "Veris"),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 1,
                child: FloatingActionButton.extended(
                  backgroundColor: const Color(0XFF0F2042),
                  // child: const Text("Back", style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context).push<void>(
                      HomePage.route(),
                    );
                  },
                  label: const Text(
                    "Exit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              children: const [
                SizedBox(
                  height: 200.0,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Thank you for your time - please tap the button below to finish. Your Prolific pay code:",
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
        ));
  }
}
