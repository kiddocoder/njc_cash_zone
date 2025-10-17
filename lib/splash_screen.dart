import 'dart:async';
import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';
// import 'package:njc_cash_zone/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _bubbleSize = 0;
  bool _expandFull = false;
  bool _showLogo = false;
  Color _backgroundColor = whiteColor;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _bubbleSize = 120;
      });
    });

    Timer(const Duration(milliseconds: 900), () {
      setState(() {
        _expandFull = true;
      });
    });

    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _backgroundColor = accentColor;
      });
    });

    Timer(const Duration(milliseconds: 1800), () {
      setState(() {
        _showLogo = true;
      });
    });

    Timer(const Duration(seconds: 3), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (_) => const Onboarding()),
      // );
      Navigator.pushReplacementNamed(context, "/main");
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bubbleMaxSize = size.height * 1.8;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutCubic,
        color: _backgroundColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Expanding bubble
            AnimatedContainer(
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOutBack,
              width: _expandFull ? bubbleMaxSize : _bubbleSize,
              height: _expandFull ? bubbleMaxSize : _bubbleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accentColor.withOpacity(0.9),
              ),
            ),

            // Centered logo fade-in
            AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              opacity: _showLogo ? 1.0 : 0.0,
              curve: Curves.easeIn,
              child: Image.asset(
                'assets/icons/logo.png',
                width: 350,
                height: 350,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
