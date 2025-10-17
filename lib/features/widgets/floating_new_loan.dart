import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';

class FloatingNewLoan extends StatelessWidget {
  const FloatingNewLoan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(32),
          child: const Icon(Icons.add, color: whiteColor, size: 32),
        ),
      ),
    );
  }
}
