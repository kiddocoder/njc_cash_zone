import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class AppTheme {
  static ThemeData light = lightTheme;
  static ThemeData dark = darkTheme;

  static ThemeMode themeMode = ThemeMode.light; // light, dark, or system
}
