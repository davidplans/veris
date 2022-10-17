import 'dart:convert';
import 'dart:io';

import 'package:Veris/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/presentation/bloc/auth_bloc.dart';
import 'package:Veris/presentation/widgets/avatar.dart';
import 'package:path_provider/path_provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<FileSystemEntity> _files = [];
  List<dynamic> _jsonFiles = [];

  @override
  initState() {
    getFiles();

    super.initState();
  }

  Future<void> getFiles() async {
    final directory = await getApplicationDocumentsDirectory();
    final dir = directory.path;
    String docDirectory = '$dir/';
    final docDir = Directory(docDirectory);
    setState(() {
      _files = docDir.listSync(recursive: true, followLinks: false);
    });
    final Iterable<File> files = _files.whereType<File>();
    for (File file in files) {
      String fileName = file.path.split('/').last;
      if (fileName.contains('.json') || fileName.contains('.JSON')) {
        var json = await file.readAsString();
        final decodingFile = jsonDecode(json);
        // nameFromId = decodingFile["properties"]["study_id"];
        _jsonFiles.add(decodingFile);

        // print(f);
      }
      setState(() {});
      // print(file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    // final user = context.select((AuthBloc bloc) => bloc.state.user);
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              color: const Color.fromARGB(255, 49, 56, 71),
              child: const Center(
                  child: Text(
                'Recent',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))),
          Expanded(
              flex: 4,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _jsonFiles.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print(_jsonFiles[index]);
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ListTile(
                        trailing: Wrap(
                          spacing: 12, // space between two icons
                          children: const <Widget>[
                            Icon(Icons.arrow_forward), // icon-1
                            // Icon(Icons.message), // icon-2
                          ],
                        ),
                        leading: _jsonFiles[index]["modules"][0]["type"] ==
                                'survey'
                            ? const Icon(Icons.bar_chart, color: Colors.amber)
                            : const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        subtitle:
                            Text(_jsonFiles[index]["properties"]["study_id"]),
                        title: Text(_jsonFiles[index]["modules"][0]["name"]),
                        tileColor:
                            _jsonFiles[index]["modules"][0]["type"] == 'survey'
                                ? Colors.blue
                                : Colors.amber[300],
                                onTap: (() {
                                  
                                }),
                      ),
                    );
                  })),

          Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              color: const Color.fromARGB(255, 49, 56, 71),
              child: const Center(
                  child: Text(
                'Start here',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))),
          Expanded(
            flex: 4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: const [Text('TEXT')],
              ),
            ),
          ),

          // Avatar(photo: user.photo),
          // const SizedBox(height: 4),
          // Text(user.email ?? '', style: textTheme.headline6),
          // const SizedBox(height: 4),
          // Text(user.name ?? '', style: textTheme.headline5),
        ],
      ),
    );
  }
}
