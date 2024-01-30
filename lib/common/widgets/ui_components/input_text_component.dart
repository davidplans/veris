import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputTextComponent extends StatefulWidget {
  final Function(dynamic) onChanged;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String labelText;
  final String? placeHolderText;
  final String? hintText;
  final String? errorText;
  final bool isEnable;
  final bool isValid;
  // final bool canValidate;
  final bool autoCapitalize;
  final bool isObscureText;
  final List<String>? assetsList;
  final Color sufixIconColor;

  const InputTextComponent({
    super.key,
    required this.onChanged,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.labelText = '',
    this.placeHolderText,
    this.hintText,
    this.errorText,
    this.isEnable = true,
    this.isValid = false,
    this.autoCapitalize = false,
    this.isObscureText = false,
    this.assetsList, 
    this.sufixIconColor = ColorConstants.iconPrimaryColor,
    // this.canValidate = false,
  });

  @override
  State<InputTextComponent> createState() => _InputTextComponentState();
}

class _InputTextComponentState extends State<InputTextComponent> {
  final double _borderRadius = 8.0;
  final double _borderWidth = 1.0;
  late bool _visibility;
  late bool _isObscureText;

  @override
  void initState() {
    _visibility = true;
    _isObscureText = widget.isObscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            widget.labelText,
            style: const TextStyle(
              fontSize: FontConstants.fontSize14,
              color: ColorConstants.textPrimaryColor,
              fontFamily: FontConstants.interFontFamily,
              fontWeight: FontWeight.w400,
              height: 1.14286
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: TextField(
            autocorrect: false,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: _isObscureText,
            textCapitalization: widget.autoCapitalize
                ? TextCapitalization.words
                : TextCapitalization.none,
            cursorHeight: 16.0,
            cursorWidth: 1.0,
            cursorColor: ColorConstants.textPrimaryColor,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: 16, top: 8.0, right: 12.0, bottom: 8.0),
                enabled: widget.isEnable,
                filled: true,
                fillColor: ColorConstants.generalInvertedColor,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(_borderRadius)),
                  borderSide: BorderSide(
                    color:ColorConstants.inputBoarderDefaultColor,
                    width: _borderWidth,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(_borderRadius)),
                  borderSide: BorderSide(
                    color: ColorConstants.inputBoarderFocusedColor,
                    width: _borderWidth,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(_borderRadius)),
                  borderSide: BorderSide(
                    color: ColorConstants.generalWarningColor,
                    width: _borderWidth,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(_borderRadius)),
                  borderSide: BorderSide(
                    color: ColorConstants.generalWarningColor,
                    width: _borderWidth,
                  ),
                ),
                labelText: widget.placeHolderText,
                errorText: null, 
                hintText: widget.hintText,
                labelStyle:
                    const TextStyle(color: ColorConstants.textDisabledColor),
                suffixIcon: widget.assetsList != null
                    ? IconButton(
                        onPressed: () => setState(() {
                          _visibility = !_visibility;
                          _isObscureText = !_isObscureText;
                        }),
                        icon: SvgPicture.asset(
                          colorFilter: ColorFilter.mode(widget.sufixIconColor, BlendMode.srcIn),
                          _visibility
                              ? widget.assetsList![0]
                              : widget.assetsList![1],
                        ),
                      )
                    : null),
            onChanged: ((text) {
              widget.onChanged(text);
            }),
          ),
        ),
      ],
    );
  }
}
