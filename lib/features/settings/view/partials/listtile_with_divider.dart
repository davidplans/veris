import 'package:flutter/material.dart';

class ListTileWithDivider extends StatelessWidget {
  final String title;
  final String value;
  const ListTileWithDivider(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          subtitle: Text(value),
        ),
        const Divider(
          color: Color.fromARGB(255, 188, 190, 196), //color of divider
          height: 5, //height spacing of divider
          thickness: 1, //thickness of divider line
          indent: 5, //spacing at the start of divider
          endIndent: 25, //spacing at the end of divider
        )
      ],
    );
  }
}
