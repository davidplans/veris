import 'package:Veris/style/color_constants.dart';
import 'package:flutter/material.dart';

class SurveyRadioButton extends StatefulWidget {
  final List<dynamic> options;
  final Function(bool) onChanged;
  const SurveyRadioButton(
      {super.key, required this.options, required this.onChanged});

  @override
  State<SurveyRadioButton> createState() => _SurveyRadioButtonState();
}

class _SurveyRadioButtonState extends State<SurveyRadioButton> {
  String _currentValue = '';
  int _currentIndex = -1;

  List<Widget> _buildRadioWidget(List<dynamic> options) {
    List<Widget> listRadioButtons = [];

    for (int i = 0; i < options.length; i++) {
      listRadioButtons.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Container(
            decoration: BoxDecoration(
                color: _currentIndex == i
                    ? ColorConstants.testSelectedColor
                    : ColorConstants.inputBackgroundDisableColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: RadioListTile(
              title: Text(options[i]),
              activeColor: ColorConstants.iconSecondaryColor,
              value: options[i].toString(),
              groupValue: _currentValue,
              onChanged: (value) {
                setState(() {
                  _currentValue = value.toString();
                  _currentIndex = i;
                });
                widget.onChanged(true);
              },
            ),
          ),
        ),
      );
    }
    return listRadioButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _buildRadioWidget(widget.options));
  }
}
