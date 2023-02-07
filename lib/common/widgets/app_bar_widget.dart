import 'package:Veris/features/home/view/home_page.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  String title;
  AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Cancel progress?'),
                    content: const Text(
                        "Are you sure you want to cancel this module?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel')),
                      TextButton(
                          onPressed: () {
                            Routes.goHome(context);
                          },
                          child: const Text('Yes, abort'))
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.home))
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
