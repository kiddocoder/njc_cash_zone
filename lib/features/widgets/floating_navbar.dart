import 'package:flutter/material.dart';
import 'package:njc_cash_zone/features/dashboard/dashboard.dart';
import 'package:njc_cash_zone/features/loans/loans_screen.dart';

class FloatingNavbar extends StatelessWidget {
  final int activeIndex;

  const FloatingNavbar({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'icon': "assets/icons/home_svgrepo.png",
        'label': 'Dashboard',
        'route': const DashboardScreen(),
      },
      {
        'icon': "assets/icons/loan-round_svgrepo.png",
        'label': 'Loans',
        'route': const LoansScreen(),
      },
      {
        'icon': "assets/icons/chats-chat-sms-talk_svgrepo.png",
        'label': 'Chats',
        'route': const DashboardScreen(),
      },
      {
        'icon': "assets/icons/history-round_svgrepo.png",
        'label': 'History',
        'route': const DashboardScreen(),
      },
      {
        'icon': "assets/icons/user_svgrepo.png",
        'label': 'Profile',
        'route': const DashboardScreen(),
      },
    ];

    return Container(
      height: 64,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isActive = index == activeIndex;

          return _buildNavItem(
            image: item['icon'] as String,
            label: item['label'] as String,
            isActive: isActive,
            onTap: () {
              if (!isActive) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => item['route'] as Widget),
                );
              }
            },
          );
        }),
      ),
    );
  }
}

Widget _buildNavItem({
  required String image,
  required String label,
  required bool isActive,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: isActive
          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 10)
          : const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF65B947).withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: 20,
            color: isActive ? const Color(0xFF65B947) : const Color(0xFF9CA3AF),
          ),
          if (isActive) ...[
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF65B947),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    ),
  );
}
