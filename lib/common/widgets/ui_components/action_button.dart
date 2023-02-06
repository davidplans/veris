import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final dynamic action;

  const ActionButton(
      {Key? key,
      required this.name,
      this.icon = Icons.arrow_forward,
      required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      backgroundColor: const Color(0XFF0F2042),
      onPressed: action,
      label: Text(name, style: const TextStyle(color: Colors.white)),
      heroTag: null,
    );
  }
}
