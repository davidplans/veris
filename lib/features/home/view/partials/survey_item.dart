import 'dart:convert';

import 'package:Veris/common/widgets/ui_components/colored_badge_container.dart';
import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/routes/routes.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SurveyItem extends StatefulWidget {
  final ModuleForHomePage module;
  const SurveyItem({Key? key, required this.module}) : super(key: key);

  @override
  State<SurveyItem> createState() => _SurveyItemState();
}

class _SurveyItemState extends State<SurveyItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Row(children: [
          Text(
            widget.module.name,
            style: const TextStyle(
                fontFamily: FontConstants.interFontFamily,
                fontSize: FontConstants.fontSize16,
                color: ColorConstants.textPrimaryColor,
                fontWeight: FontWeight.w400,
                height: 1.411),
          ),
          const SizedBox(
            width: 8.0,
          ),
          const ColoredBadgeContainer(
            colorKey: 'orange',
            containerText: '0/1 today',
          ),
        ]),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        collapsedShape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        trailing: AnimatedRotation(
          turns: isExpanded ? 0.25 : 0,
          duration: const Duration(milliseconds: 300),
          child: SvgPicture.asset(
            'assets/icons/chevron-right.svg',
          ),
        ),
        children: [
          ListView.builder(
            itemCount: widget.module.sections!.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int indexSection) {
              final sectionItem = widget.module.sections![indexSection];
              final sectionName = sectionItem.name;
              return ListTile(
                title: Text(
                  "Section $sectionName",
                  style: const TextStyle(
                    fontFamily: FontConstants.interFontFamily,
                    fontSize: FontConstants.fontSize16,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.textSecondaryColor,
                    height: 2.0,
                  ),
                ),
                trailing: Wrap(
                  spacing: 12, // space between two icons
                  children: [
                    SvgPicture.asset(
                      'assets/icons/arrow-forward.svg',
                    ),
                  ],
                ),
                onTap: (() {
                  List<dynamic> questions =
                      List.from(jsonDecode(sectionItem.questions!) as Iterable);
                  context.go(Routes.survey.path, extra: {
                    'questions': questions,
                    'moduleId': widget.module.uuid,
                    'sectionId': sectionItem.id!,
                    'sectionName': sectionName,
                    'moduleName': widget.module.name,
                  });
                }),
              );
            },
          )
        ]);
  }
}
