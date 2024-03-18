import 'package:Veris/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroGoToQRButton extends StatelessWidget {
  const IntroGoToQRButton({
    super.key,
    required this.expanded,
  });

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: !expanded ? 120 : 0,
      child: Container(
        height: 5,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Scan QR'),
              onPressed: () {
                context.go(Routes.scanQR.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}
