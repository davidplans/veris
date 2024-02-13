import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';

class OutlinedButtonComponent extends StatefulWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final Color borderColor;
  final Function() onPressed;
  const OutlinedButtonComponent({
    super.key,
    required this.title,
    required this.onPressed,
    required this.backgroundColor,
    required this.titleColor,
    required this.borderColor,

  });

  @override
  State<OutlinedButtonComponent> createState() => _OutlinedButtonComponentState();
}

class _OutlinedButtonComponentState extends State<OutlinedButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 46,
      child: OutlinedButton(
          onPressed: () => widget.onPressed(),
          style: TextButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, color: widget.borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        child:             Text(
              widget.title,
              style: TextStyle(
                  fontFamily: FontConstants.interFontFamily,
                  color: widget.titleColor,
                  fontWeight: FontWeight.w500,
                  fontSize: FontConstants.fontSize16,
                  height: 1.375),
            ),
      ),
    );
  }
}
