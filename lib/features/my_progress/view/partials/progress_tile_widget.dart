import 'dart:developer';

import 'package:Veris/common/widgets/ui_components/colored_badge_container.dart';
import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';

class ProgressTileWidget extends StatefulWidget {
  final Map<String, dynamic>? messages;
  const ProgressTileWidget({super.key, this.messages});

  @override
  State<ProgressTileWidget> createState() => _ProgressTileWidgetState();
}

class _ProgressTileWidgetState extends State<ProgressTileWidget> {
  List<Widget> _buildBadges(Map<String, dynamic> messages) {
    List<Widget> messagesList = [];
    messages.forEach(
      (colorKey, message) {
        messagesList.add(
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ColoredBadgeContainer(
              colorKey: colorKey,
              containerText: message,
            ),
          ),
        );
      },
    );
    return messagesList;
  }

  @override
  Widget build(BuildContext context) {
    log(widget.messages!.keys.toList().toString());
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child:  Container(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: const Text(
                          'Pat Test',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: FontConstants.interFontFamily,
                              fontSize: FontConstants.fontSize17,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.textSecondaryColor),
                        ),
                      ),
                    ),
                    Text(
                      '2/12 completed',
                      style: TextStyle(
                          fontFamily: FontConstants.interFontFamily,
                          fontSize: FontConstants.fontSize14,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.textSecondaryColor),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: LinearProgressIndicator(
                  minHeight: 6.0,
                  value: 0.2,
                  backgroundColor: ColorConstants.separatorPrimaryColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      ColorConstants.progressBarPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Row(
                  children: widget.messages != null
                      ? _buildBadges(widget.messages!)
                      : [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
