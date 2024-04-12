import 'package:Veris/common/widgets/ui_components/outline_button_component.dart';
import 'package:Veris/routes/routes.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QRCodeButton extends StatelessWidget {
  final Function(dynamic) onGetProtocolUrl;
  const QRCodeButton({super.key, required this.onGetProtocolUrl});

  @override
  Widget build(BuildContext context) {
    return OutlinedButtonComponent(
      title: 'Scan QR code',
      onPressed: () async {
        String? url = await context.pushNamed(Routes.scanQR.name);
        if (url != null) {
          onGetProtocolUrl(url);
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red[200],
            content: Text(url.toString()),
          ));
        }
      },
      backgroundColor: ColorConstants.btnOutlineDefaultColor,
      titleColor: ColorConstants.btnPrimaryDefaultColor,
      borderColor: ColorConstants.btnOutlineBoarderColor,
    );
  }
}
