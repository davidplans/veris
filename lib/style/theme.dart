import 'package:Veris/style/color_constants.dart';
import 'package:Veris/style/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: const Color(0xFF000000),
  primaryColorLight: const Color(0xFFB2EBF2),
  primaryColor: const Color(0xFF189B8D),
  scaffoldBackgroundColor: ColorConstants.generalBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.transparent,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: ColorConstants.iconSecondaryColor,
    unselectedItemColor: ColorConstants.textSecondaryColor,
    selectedLabelStyle: TextStyle(
        fontFamily: FontConstants.interFontFamily,
        fontSize: FontConstants.fontSize13,
        fontWeight: FontWeight.w600,
        height: 1.23),
    unselectedLabelStyle: TextStyle(
        fontFamily: FontConstants.interFontFamily,
        fontSize: FontConstants.fontSize13,
        fontWeight: FontWeight.w500,
        height: 1.23),
  ),
);
