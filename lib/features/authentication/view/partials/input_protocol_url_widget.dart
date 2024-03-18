import 'package:Veris/common/widgets/ui_components/input_text_component.dart';
import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:flutter/material.dart';

class InputProtocolUrlWidget extends StatefulWidget {
  final ValueChanged<String> onUrlAdded;
  const InputProtocolUrlWidget({super.key, required this.onUrlAdded});

  @override
  State<InputProtocolUrlWidget> createState() => _InputProtocolUrlWidgetState();
}

class _InputProtocolUrlWidgetState extends State<InputProtocolUrlWidget> {
  TextEditingController _controller = TextEditingController();
  final studyProtocolHelper = StudyProtocolHelper();
  final String testUrl =
      'https://firebasestorage.googleapis.com/v0/b/patdeployments.appspot.com/o/veris_test_2.json?alt=media&token=80d0dfa5-8720-4449-bbf0-cf630189768f';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTextComponent(
          controller: _controller,
          onChanged: (text) {
            setState(() {
              _controller.text = text;
            });
          },
          keyboardType: TextInputType.url,
          placeHolderText: 'Enter protocol URL',
          labelText: 'Study protocol URL',
          hintText: '',
          errorText: null,
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.onUrlAdded(testUrl);
               _controller = TextEditingController(text: testUrl);
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green[200],
              content: const Text('Pasted!'),
              duration: const Duration(seconds: 2),
            ));
          },
          child: const Text(
            "Use Demo protocol",
            style: TextStyle(color: Color.fromARGB(255, 177, 92, 92), fontSize: 16),
          ),
        ),
      ],
    );
  }
}