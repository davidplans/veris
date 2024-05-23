import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CustomHtmlWidget extends StatefulWidget {
  final String htmlText;
  final Function(bool)? onChanged;
  const CustomHtmlWidget({super.key, required this.htmlText, this.onChanged});

  @override
  State<CustomHtmlWidget> createState() => _CustomHtmlWidgetState();
}

class _CustomHtmlWidgetState extends State<CustomHtmlWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.onChanged != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged!(true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(widget.htmlText);
  }
}
