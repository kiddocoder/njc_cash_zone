import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';

class SplideDots extends StatelessWidget {
  final int index;
  final int currentItem;
  const SplideDots({super.key, required this.index, required this.currentItem});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: currentItem == index ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: currentItem == index ? accentColor : const Color(0xFFD1D5DB),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
