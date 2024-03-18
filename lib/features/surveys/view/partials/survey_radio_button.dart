import 'package:Veris/style/color_constants.dart';
import 'package:flutter/material.dart';

class SurveyRadioButton extends StatefulWidget {
  final List<dynamic> options;
  const SurveyRadioButton({super.key, required this.options});

  @override
  State<SurveyRadioButton> createState() => _SurveyRadioButtonState();
}

class _SurveyRadioButtonState extends State<SurveyRadioButton> {
  String current = '';
 int currentIndex = -1;

  List<Widget> _buildRadioWidget(List<dynamic> options) {
    List<Widget> listRadioButtons = [];
   
    for (int i = 0; i < options.length; i++) {
      listRadioButtons.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Container(
            decoration: BoxDecoration(
                color: currentIndex == i ? ColorConstants.testSelectedColor :  ColorConstants.inputBackgroundDisableColor,
                borderRadius: BorderRadius.circular(8.0)),
            child: RadioListTile(
              title: Text(options[i]),
              activeColor: ColorConstants.iconSecondaryColor,
              value: options[i].toString(),
              groupValue: current,
              onChanged: (value) {
                setState(() {
                  current = value.toString();
                  currentIndex = i;
                });
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
