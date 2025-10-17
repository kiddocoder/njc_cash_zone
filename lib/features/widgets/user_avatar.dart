import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';

class UserAvatar extends StatelessWidget {
  final String image;
  final double? width;

  const UserAvatar({super.key, required this.image, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 44,
      height: width ?? 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: accentColor.withOpacity(0.1),
      ),
      child: ClipOval(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.person, color: Colors.white, size: 22);
          },
        ),
      ),
    );
  }
}
