import 'package:flutter/material.dart';

typedef InputCallback = void Function(String url);

class IntroUrlInput extends StatelessWidget {
  const IntroUrlInput({
    super.key,
    required this.currentUrl,
    required this.onChanged,
  });

  final String currentUrl;
  final InputCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: currentUrl),
      keyboardType: TextInputType.url,
      decoration: const InputDecoration(
        labelText: 'Study protocol URL',
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.all(8.0),
      ),
      onChanged: ((value) {
        onChanged(value);
      }),
    );
  }
}
