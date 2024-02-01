import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final String? prefixIconPath;
  final String? sufixIconPath;
  final Function() onPressed;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.backgroundColor,
    required this.titleColor,
    this.prefixIconPath,
    this.sufixIconPath,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final bool isPrefixIcon = widget.prefixIconPath != null;
    final bool isSufixIcon = widget.sufixIconPath != null;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 46,
      child: TextButton(
        onPressed: () => widget.onPressed(),
        style: TextButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isPrefixIcon
                ? Row(
                    children: [
                      SvgPicture.asset(
                          colorFilter: ColorFilter.mode(
                              widget.titleColor, BlendMode.srcIn),
                          widget.prefixIconPath!),
                      const SizedBox(width: 8.0),
                    ],
                  )
                : Container(),
            Text(
              widget.title,
              style: TextStyle(
                  fontFamily: FontConstants.interFontFamily,
                  color: widget.titleColor,
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
                              widget.titleColor, BlendMode.srcIn),
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
