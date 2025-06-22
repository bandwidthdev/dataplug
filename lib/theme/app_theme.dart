import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF2E5A92),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E5A92)),
    fontFamily: 'Montserrat',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF2E5A92),
    colorScheme: ColorScheme.dark(primary: const Color(0xFF2E5A92)),
    fontFamily: 'Montserrat',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
