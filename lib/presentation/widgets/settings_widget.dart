import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Veris/presentation/bloc/auth_bloc.dart';
import 'package:Veris/presentation/widgets/avatar.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthBloc bloc) => bloc.state.user);
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[




          Avatar(photo: user.photo),
          const SizedBox(height: 4),
          Text(user.email ?? '', style: textTheme.headline6),
          const SizedBox(height: 4),
          Text(user.name ?? '', style: textTheme.headline5),
        ],
      ),
    );
  }
}
