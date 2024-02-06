import 'package:Veris/core/utils/main_constants.dart';
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
  final bool autoCapitalize;
  final bool isObscureText;
  final List<String>? iconsList;
  final Color sufixIconColor;
  final String? iconAction;

  const InputTextComponent(
      {super.key,
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
      this.iconsList,
      this.sufixIconColor = ColorConstants.iconPrimaryColor,
      this.iconAction});

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
                height: 1.14286),
          ),
        ),
        TextField(
          key: const Key('InputTextComponent'),
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
              errorText: widget.errorText,
              errorStyle: const TextStyle(
                  color: ColorConstants.generalWarningColor,
                  fontFamily: FontConstants.interFontFamily,
                  fontSize: FontConstants.fontSize13,
                  fontWeight: FontWeight.w500,
                  height: 1.23),
              contentPadding: const EdgeInsets.only(
                  left: 16, top: 8.0, right: 12.0, bottom: 8.0),
              enabled: widget.isEnable,
              filled: true,
              fillColor: ColorConstants.generalInvertedColor,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
                borderSide: BorderSide(
                  color: ColorConstants.inputBoarderDefaultColor,
                  width: _borderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
                borderSide: BorderSide(
                  color: ColorConstants.inputBoarderFocusedColor,
                  width: _borderWidth,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
                borderSide: BorderSide(
                  color: ColorConstants.generalWarningColor,
                  width: _borderWidth,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
                borderSide: BorderSide(
                  color: ColorConstants.generalWarningColor,
                  width: _borderWidth,
                ),
              ),
              labelText: widget.placeHolderText,
              hintText: widget.hintText,
              labelStyle:
                  const TextStyle(color: ColorConstants.textDisabledColor),
              suffixIcon: widget.iconsList != null
                  ? IconButton(
                      onPressed: () => setState(() {
                        switch (widget.iconAction) {
                          case MainConstants.visibilityIconAction:
                            _visibility = !_visibility;
                            _isObscureText = !_isObscureText;
                            break;
                          case MainConstants.cleanIconAction:
                            widget.controller!.clear();
                        }
                      }),
                      icon: SvgPicture.asset(
                        colorFilter: ColorFilter.mode(
                            widget.errorText == null
                                ? widget.sufixIconColor
                                : ColorConstants.generalWarningColor,
                            BlendMode.srcIn),
                        _visibility
                            ? widget.iconsList![0]
                            : widget.iconsList![1],
                      ),
                    )
                  : null),
          onChanged: ((text) {
            widget.onChanged(text);
          }),
        ),
        // widget.errorText != null
        //     ? Text(
        //         widget.errorText!,
        //         style: TextStyle(
        //             color: ColorConstants.generalWarningColor,
        //             fontFamily: FontConstants.interFontFamily,
        //             fontSize: FontConstants.fontSize13,
        //             fontWeight: FontWeight.w500,
        //             height: 1.23),
        //       )
        //     : Container()
      ],
    );
  }
}
