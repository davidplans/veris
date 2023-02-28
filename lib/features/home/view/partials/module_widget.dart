import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/home/view/partials/not_supported_item.dart';
import 'package:Veris/features/home/view/partials/pat_item.dart';
import 'package:Veris/features/home/view/partials/survey_item.dart';
import 'package:flutter/material.dart';

class ModuleWidget extends StatelessWidget {
  final ModuleForHomePage module;

  const ModuleWidget({Key? key, required this.module}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (module.type) {
      case "survey":
        return SurveyItem(module: module);
      case "pat":
        return PatItem(module: module);
      default:
        return NotSupportedItem(module: module);
    }
  }
}
