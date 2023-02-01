import 'package:Veris/common/widgets/app_bar_widget.dart';
import 'package:Veris/features/pat/view/find_place_text_page.dart';
import 'package:flutter/material.dart';

class StartPatPage extends StatelessWidget {
  const StartPatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: "Veris"),
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
                        builder: (context) => const FindPlacePage(),
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
