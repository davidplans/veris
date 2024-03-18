import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';

class SurveyInputText extends StatefulWidget {
  final Function(String) onChanged;
  const SurveyInputText({super.key, required this.onChanged});

  @override
  State<SurveyInputText> createState() => _SurveyInputTextState();
}

class _SurveyInputTextState extends State<SurveyInputText> {
  final double _borderRadius = 8.0;
  final double _borderWidth = 1.0;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        widget.onChanged(text);
      },
      cursorWidth: 1.0,
      style: const TextStyle(
          fontFamily: FontConstants.interFontFamily,
          fontSize: FontConstants.fontSize20,
          fontWeight: FontWeight.w500,
          height: 1.3,
          color: ColorConstants.textPrimaryColor),
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
            left: 8.0, top: 16.0, right: 8.0, bottom: 16.0),
        filled: true,
        fillColor: ColorConstants.generalInvertedColor,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
          borderSide: BorderSide(
            color: ColorConstants.inputBoarderDefaultColor,
            width: _borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
          borderSide: BorderSide(
            color: ColorConstants.inputBoarderFocusedColor,
            width: _borderWidth,
          ),
        ),
        // labelText: widget.placeHolderText,
        // hintText: 'widget.hintText',
      ),
    );
  }
}
