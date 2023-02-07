import 'package:Veris/features/pat/models/body.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'body_select_size_controller.dart';


class BodySVGParser {
  static BodySVGParser? _instance;

  static BodySVGParser get instance {
    _instance ??= BodySVGParser._init();
    return _instance!;
  }

  final sizeController = BodySelectSizeController.instance;

  BodySVGParser._init();

  Future<List<Body>> svgToBodyList(String body) async {
    final svgBody = await rootBundle.loadString('assets/images/$body');

    List<Body> bodyList = [];

    final regExp = RegExp('.* id="(.*)" title="(.*)" .* d="(.*)"',
        multiLine: true, caseSensitive: false, dotAll: false);

    regExp.allMatches(svgBody).forEach((cityData) {
      final body = Body(
          id: cityData.group(1)!,
          title: cityData.group(2)!,
          path: parseSvgPath(cityData.group(3)!));

      sizeController.addBounds(body.path.getBounds());
      bodyList.add(body);
    });
    return bodyList;
  }
}
