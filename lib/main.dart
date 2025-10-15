import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/theme/app_theme.dart';
import 'package:njc_cash_zone/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loan Management System',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: AppTheme.themeMode,
      home: const SplashScreen(),
    );
  }
}
