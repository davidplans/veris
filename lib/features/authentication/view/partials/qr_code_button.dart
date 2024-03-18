import 'package:Veris/common/widgets/ui_components/outline_button_component.dart';
import 'package:Veris/routes/routes.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QRCodeButton extends StatelessWidget {
  const QRCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButtonComponent(
      title: 'Scan QR code',
      onPressed: () {
        context.go(Routes.scanQR.path);
      },
      backgroundColor: ColorConstants.btnOutlineDefaultColor,
      titleColor: ColorConstants.btnPrimaryDefaultColor,
      borderColor: ColorConstants.btnOutlineBoarderColor,
    );
  }
}