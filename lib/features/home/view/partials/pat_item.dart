import 'package:Veris/common/widgets/ui_components/colored_badge_container.dart';
import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/pat/view/start_pat_text_page.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatItem extends StatefulWidget {
  final ModuleForHomePage module;
  const PatItem({Key? key, required this.module}) : super(key: key);

  @override
  State<PatItem> createState() => _PatItemState();
}

class _PatItemState extends State<PatItem> {
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
            colorKey: 'pink',
            containerText: '0/1 today',
          ),
        ]),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
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
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        children: [
          ListTile(
            title: const Text(
              "Start test",
              style: TextStyle(
                fontFamily: FontConstants.interFontFamily,
                fontSize: FontConstants.fontSize16,
                fontWeight: FontWeight.w400,
                color: ColorConstants.textSecondaryColor,
                height: 2.0,
              ),
            ),
            trailing: Wrap(
              spacing: 12,
              children: [
                SvgPicture.asset(
                  'assets/icons/arrow-forward.svg',
                ),
              ],
            ),
            onTap: (() async {
              final prefs = await SharedPreferences.getInstance();

              final studyId = prefs.getString('study_id');
              final now = DateTime.now().microsecondsSinceEpoch;
              final String moduleResultID = '$studyId-${widget.module.id}-$now';

              prefs.setInt('maxTrials', widget.module.options['total_trials']);
              prefs.setInt(
                  'stepBodySelect', widget.module.options['step_body_select']);
              prefs.setInt('numRuns', 0);
              prefs.setInt('completeTrials', 0);
              prefs.setString('currentModuleResultId', moduleResultID);
              prefs.setInt('moduleId', widget.module.id);

              // ignore: use_build_context_synchronously
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const StartPatPage();
                  },
                ),
              );
            }),
          )
        ]);
  }
}
