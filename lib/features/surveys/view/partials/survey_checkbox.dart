import 'package:flutter/material.dart';

class SurveyCheckBox extends StatefulWidget {
  final List<dynamic> options;
  final Function(dynamic) onChanged;
  const SurveyCheckBox(
      {super.key, required this.onChanged, required this.options});

  @override
  State<SurveyCheckBox> createState() => _SurveyCheckBoxState();
}

class _SurveyCheckBoxState extends State<SurveyCheckBox> {
  bool? _checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text("title text"),
      value: _checkedValue,
      onChanged: (newValue) {
        widget.onChanged(newValue);
        setState(() {
          _checkedValue = newValue;
        });
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }
}
