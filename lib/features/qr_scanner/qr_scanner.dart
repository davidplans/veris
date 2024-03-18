import 'package:Veris/core/utils/study_protocol_helper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
// import 'package:Veris/features/authentication/view/auth_view.dart';
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

  final studyProtocolHelper = StudyProtocolHelper();

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
                leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () => context.go('/home'),
          child: SvgPicture.asset(
            'assets/icons/arrow-backword.svg',
          ),
        ),
      ),
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
              controller: cameraController,
              onDetect: (capture) async {
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  if (barcode.rawValue == null) {
                    debugPrint('Failed to scan QRcode');
                  } else {
                    final decodeString = barcode.rawValue!;
                    setState(() {
                      code = decodeString;
                    });

                    final res = await studyProtocolHelper
                        .getAndSaveStudyProtocol(context, decodeString);

                    if (!res) {
                      return;
                    }

                    cameraController.stop();
                    cameraController.dispose();

                    // ignore: use_build_context_synchronously
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const AuthView()),
                    // );

                    debugPrint('Barcode found! $code');
                  }
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
