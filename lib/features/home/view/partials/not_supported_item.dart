import 'package:Veris/common/widgets/ui_components/colored_badge_container.dart';
import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotSupportedItem extends StatefulWidget {
  final ModuleForHomePage module;
  const NotSupportedItem({Key? key, required this.module}) : super(key: key);

  @override
  State<NotSupportedItem> createState() => _NotSupportedItemState();
}

class _NotSupportedItemState extends State<NotSupportedItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return 
    ExpansionTile(
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
            colorKey: 'gray',
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
              return ListTile(
                title: const Text(
                  "Module type is not supported!",
                  style: TextStyle(
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
                onTap: () {},
              );
            },
          )
        ]);
  }
}
