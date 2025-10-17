import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String _selectedFilter = 'All';

  final List<String> filters = [
    'All',
    'Message',
    'Reminders',
    'System',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildFilterChips(),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildNotificationItem(
                    icon: Icons.trending_up,
                    iconColor: accentColor,
                    title: 'Loan Request Submitted',
                    time: 'Today 1:53 PM',
                    amount: '+R 5,000.00',
                    amountColor: accentColor,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationItem(
                    icon: Icons.chat_bubble_outline,
                    iconColor: accentColor,
                    title: 'Message from Support',
                    time: 'Today 1:53 PM',
                    badge: 'unread',
                    badgeColor: redColor,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationItem(
                    icon: Icons.notifications_active_outlined,
                    iconColor: accentColor,
                    title: 'remaining amount',
                    time: 'Today 1:53 PM',
                    amount: '-R 1,200.00',
                    amountColor: redColor,
                  ),
                  const SizedBox(height: 12),
                  _buildNotificationItem(
                    icon: Icons.settings_outlined,
                    iconColor: accentColor,
                    title: 'New updates',
                    time: 'Today 1:53 PM',
                    badge: 'View',
                    badgeColor: accentColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: whiteColor, size: 22),
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: blackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? accentColor : whiteColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isSelected ? accentColor : const Color(0xFFE5E7EB),
                    width: 1.5,
                  ),
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? whiteColor : blackColor,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String time,
    String? amount,
    Color? amountColor,
    String? badge,
    Color? badgeColor,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: grayColor),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          if (amount != null)
            Text(
              amount,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: amountColor ?? accentColor,
              ),
            ),
          if (badge != null)
            Text(
              badge,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: badgeColor ?? accentColor,
              ),
            ),
        ],
      ),
    );
  }
}
