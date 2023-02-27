import 'package:Veris/common/widgets/ui_components/action_button.dart';
import 'package:flutter/material.dart';

typedef ButtonCallback = void Function(bool val);

class IntroModeSwitch extends StatelessWidget {
  const IntroModeSwitch({
    super.key,
    required this.expanded,
    required this.onChanged,
  });

  final ButtonCallback onChanged;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionButton(
          icon: expanded ? Icons.arrow_upward : Icons.arrow_downward,
          name: !expanded ? 'Enter URL' : 'Scan QR',
          action: () => {onChanged(!expanded)},
        ),
      ],
    );
  }
}
