import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/core/view/home_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class FinishPage extends StatefulWidget {
  const FinishPage({super.key});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
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
                    Routes.goHome(context);
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
