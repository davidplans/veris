import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: const Color(0xFF000000),
  primaryColorLight: const Color(0xFFB2EBF2),
  primaryColor: const Color(0xFF189B8D),
  colorScheme: const ColorScheme.light(secondary: Colors.red),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  appBarTheme: const AppBarTheme(backgroundColor: Color(0XFF0F2042)),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(color:Color(0XFF0F2042)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF189B8D)),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.green),
    ),
  ),
);
