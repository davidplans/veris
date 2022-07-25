import 'package:Veris/data/models/body.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:flutter/services.dart' show rootBundle;
import './size_controller.dart';

class Parser {
  static Parser? _instance;

  static Parser get instance {
    _instance ??= Parser._init();
    return _instance!;
  }

  final sizeController = SizeController.instance;

  Parser._init();

  Future<List<Body>> svgToCityList(String country) async {
    final svgCountry = await rootBundle.loadString('assets/images/$country');

    List<Body> bodyList = [];

    final regExp = RegExp('.* id="(.*)" title="(.*)" .* d="(.*)"',
        multiLine: true, caseSensitive: false, dotAll: false);

    regExp.allMatches(svgCountry).forEach((cityData) {
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
