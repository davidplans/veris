import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/authentication/view/auth_view.dart';

class DownladJSON {
  Future<bool> downloadFile(String url, BuildContext context) async {
    var progressString = "";
    Dio dio = Dio();
    final String unixTime = (DateTime.now().millisecondsSinceEpoch).toString();

    final _prefs = await SharedPreferences.getInstance();
    try {
      var dir = await getApplicationDocumentsDirectory();

      // var response = await dio.download(url, "${dir.path}/$unixTime.json",
      //     options: Options(
      //       responseType: ResponseType.json,
      //     ),
      //     onReceiveProgress: (rec, total) async {
      //   progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
      // });
      var response = await dio.get(
        url,
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      // print(response);

      if (response.headers.value('content-type') == 'application/json') {
        // showDialog(
        //   context: context,
        //   builder: (context) {
        //     return AlertDialog(
        //       title: const Text('Downloading...'),
        //       content: Text(progressString),
        //     );
        //   },
        // );
        // var localFile = File("${dir.path}/$unixTime.json");
        try {
          // final json = await localFile.readAsString();
          final decodingFile = jsonDecode(response.toString());
          final studyId = decodingFile["properties"]["study_id"];
          // print(nameFromId);
          if (studyId.isNotEmpty) {
            await _prefs.setString('studyId', studyId);
            await _prefs
                .setString('json_file', jsonEncode(decodingFile))
                .whenComplete(() {
              // localFile.delete;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AuthView()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green[200],
                  content: const Text("JSON file downloaded successfully!"),
                ),
              );
            });

            // var path = localFile.path;
            // var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
            // var newPath =
            //     path.substring(0, lastSeparator + 1) + nameFromId + ".json";
            // localFile.rename(newPath).whenComplete(() => {
            //       localFile.delete,

            //       // print(localFile.path),
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => const AuthView()),
            //       ),
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           backgroundColor: Colors.green[200],
            //           content: const Text("JSON file downloaded successfully!"),
            //         ),
            //       )
            //     });
            // localFile.delete();
            return true;
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('JSON file error!'),
                  content:
                      const Text("Downloading JSON file don't have 'STUDY ID'"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Try again'))
                  ],
                );
              },
            );
            // localFile.delete();
            return false;
          }
        } catch (error) {
          print(error);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error file type!'),
                content: const Text("Downloading file is not json!"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Try again'))
                ],
              );
            },
          );
          // localFile.delete();
          return false;
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('URL error!!!'),
              content: const Text("Downloading file is not json!"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Try again'))
              ],
            );
          },
        );
        return false;
      }
    } catch (e) {
      print(e.toString());
      if (e is DioError) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('URL error!'),
              content: const Text("Downloading file is not json!"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Try again'))
              ],
            );
          },
        );
      }
      return false;
    }
  }
}
