import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuestionsWidget extends StatefulWidget {
  final List<dynamic> questions;

  const QuestionsWidget({Key? key, required this.questions}) : super(key: key);

  @override
  State<QuestionsWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // print(widget.questions.first);
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          final item = widget.questions[index];
          return ListTile(
            title: Text(item['id']),
          );
        },
        // children: [for (var item in widget.questions)
        // _questionWidget(item)
        // ],
      ),
    );
  }

  Widget _questionWidget(Map<String, dynamic> item) {
    Widget w = Container();
    print(item['type']);
    switch (item['type']) {
      case "instruction":
        w = _instructionWidget(item['id']);
        break;
      case "text":
        w = _textWidget(item['id']);
        break;
      case "milti":
        w = _multiWidget(item['id']);
        break;
    }
    return w;
  }

  Widget _multiWidget(String text) {
    return Container(
      width: 10,
      height: 10,
      color: Colors.amber,
      child: Text(text),
    );
  }

  Widget _instructionWidget(String text) {
    return Container(
      child: Text(text),
      width: 100,
      height: 100,
      color: Colors.black38,
    );
  }

  Widget _textWidget(String text) {
    return Container(
      child: Text(text),
      width: 10,
      height: 10,
      color: Colors.blueAccent,
    );
  }
}
