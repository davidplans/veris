import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:flutter/material.dart';

class NotSupportedItem extends StatelessWidget {
  final ModuleForHomePage module;
  const NotSupportedItem({Key? key, required this.module}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(module.name),
        backgroundColor: const Color.fromARGB(255, 100, 155, 200),
        collapsedBackgroundColor: Colors.grey[300],
        leading: const Icon(Icons.error, color: Colors.grey),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ListTile(
              title: const Text("Module type is not supported!"),
              textColor: Colors.white,
              iconColor: Colors.white,
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: const <Widget>[
                  Icon(Icons.arrow_forward), // icon-1
                ],
              ),
              onTap: (() async {}),
            ),
          )
        ]);
  }
}
