import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainButtonComponent extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final String? prefixIconPath;
  final String? sufixIconPath;
  final Function()? onPressed;
  const MainButtonComponent({
    super.key,
    required this.title,
    this.onPressed,
    required this.backgroundColor,
    required this.titleColor,
    this.prefixIconPath,
    this.sufixIconPath,
  });

  @override
  State<MainButtonComponent> createState() => _MainButtonComponentState();
}

class _MainButtonComponentState extends State<MainButtonComponent> {
  @override
  Widget build(BuildContext context) {
    final bool isPrefixIcon = widget.prefixIconPath != null;
    final bool isSufixIcon = widget.sufixIconPath != null;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 46,
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          disabledBackgroundColor: ColorConstants.btnPrimaryDisabledColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isPrefixIcon
                ? Row(
                    children: [
                      SvgPicture.asset(
                          colorFilter: ColorFilter.mode(
                             widget.onPressed != null ? widget.titleColor : ColorConstants.textDisabledColor, BlendMode.srcIn),
                          widget.prefixIconPath!),
                      const SizedBox(width: 8.0),
                    ],
                  )
                : Container(),
            Text(
              widget.title,
              style: TextStyle(
                  fontFamily: FontConstants.interFontFamily,
                  color: widget.onPressed != null ? widget.titleColor : ColorConstants.textDisabledColor,
                  fontWeight: FontWeight.w500,
                  fontSize: FontConstants.fontSize16,
                  height: 1.375),
            ),
            isSufixIcon
                ? Row(
                    children: [
                      const SizedBox(width: 8.0),
                      SvgPicture.asset(
                          colorFilter: ColorFilter.mode(
                              widget.onPressed != null ? widget.titleColor : ColorConstants.textDisabledColor, BlendMode.srcIn),
                          widget.sufixIconPath!),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
