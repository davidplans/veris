import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: ColorConstants.textSecondaryColor,
            fontFamily: FontConstants.interFontFamily,
            fontSize: FontConstants.fontSize20,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.3,
            height: 1.3),
      ),
      // actions: [
      //   IconButton(
      //       onPressed: () {
      //         showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return AlertDialog(
      //               title: const Text('Cancel progress?'),
      //               content: const Text(
      //                   "Are you sure you want to cancel this module?"),
      //               actions: [
      //                 TextButton(
      //                     onPressed: () {
      //                       Navigator.of(context).pop();
      //                     },
      //                     child: const Text('Cancel')),
      //                 TextButton(
      //                     onPressed: () {
      //                       Routes.goHome(context);
      //                     },
      //                     child: const Text('Yes, abort'))
      //               ],
      //             );
      //           },
      //         );
      //       },
      //       icon: const Icon(Icons.home))
      // ],
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () => context.go('/welcome'),
          child: SvgPicture.asset(
            'assets/icons/arrow-backword.svg',
          ),
        ),
      ),
      leadingWidth: 48.0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
