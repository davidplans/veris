import 'package:flutter/material.dart';

class SliderNavigation extends StatelessWidget {
  final Widget nexPage;
  final bool isNeedHideBackButton;
  final String backButtonName;
  final String nextButtonName;

  const SliderNavigation(
      {Key? key,
      required this.nexPage,
      this.isNeedHideBackButton = false,
      this.backButtonName = 'Back',
      this.nextButtonName = 'Next'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isNeedHideBackButton)
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
                label: Text(
                  backButtonName,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          else
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
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => nexPage,
                  ),
                );
              },
              label: Text(
                nextButtonName,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
