import 'package:Veris/features/qr_scanner/qr_scanner.dart';
import 'package:flutter/material.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QrScanner()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
