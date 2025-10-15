import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';
import '../constants/sizes.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.light,
  primaryColor: accentColor,
  scaffoldBackgroundColor: whiteColor,
  colorScheme: const ColorScheme.light(
    primary: accentColor,
    secondary: primaryColor,
    error: redColor,
    surface: whiteColor,
    onSurface: blackColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: whiteColor,
    foregroundColor: blackColor,
    elevation: 0,
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: blackColor,
      fontFamily: 'Poppins',
    ),
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: blackColor,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: blackColor),
    bodyMedium: TextStyle(fontSize: 14, color: darkGray),
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
    fillColor: lightGray,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: darkGray.withOpacity(0.6)),
  ),
);
