import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:Veris/features/authentication/view/auth_view.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  MobileScannerController cameraController = MobileScannerController();
  String code = '';

  @override
  void dispose() {
    cameraController.stop();
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Study QR-code Scanner'),
          actions: [
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
          ],
        ),
        body: Stack(children: [
          MobileScanner(
              allowDuplicates: false,
              controller: cameraController,
              onDetect: (barcode, args) async {
                if (barcode.rawValue == null) {
                  debugPrint('Failed to scan QRcode');
                } else {
                  final decodeString = barcode.rawValue!;
                  setState(() {
                    code = decodeString;
                  });

                  final res = await StudyProtocolHelper.saveStudyProtocol(
                      context, decodeString);

                  if (!res) {
                    return;
                  }

                  cameraController.stop();
                  cameraController.dispose();

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AuthView()),
                  );

                  debugPrint('Barcode found! $code');
                }
              }),
          Center(
            child: Text(
              code,
              style: const TextStyle(fontSize: 12, color: Colors.amber),
            ),
          ),
        ]));
  }
}
