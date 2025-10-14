import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';
import '../constants/sizes.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: accentColor,
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: const ColorScheme.dark(
    primary: accentColor,
    secondary: primaryColor,
    error: redColor,
    background: blackColor,
    onBackground: whiteColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    foregroundColor: whiteColor,
    elevation: 0,
    centerTitle: true,
  ),
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: whiteColor,
    ),
    headlineMedium: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: whiteColor,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: whiteMutedColor),
    bodyMedium: const TextStyle(fontSize: 14, color: grayColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: accentColor,
      foregroundColor: whiteColor,
      minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1E1E1E),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: whiteMutedColor),
  ),
);
