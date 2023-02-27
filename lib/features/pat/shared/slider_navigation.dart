import 'package:Veris/common/widgets/ui_components/action_button.dart';
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
              child: ActionButton(
                  name: backButtonName,
                  icon: Icons.arrow_back,
                  action: () {
                    Navigator.of(context).pop();
                  }),
            )
          else
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 1,
              child: ActionButton(
                  name: nextButtonName,
                  action: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => nexPage,
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
