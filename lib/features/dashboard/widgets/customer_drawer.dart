import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';
import 'package:njc_cash_zone/features/dashboard/widgets/drawer_footer.dart';
import 'package:njc_cash_zone/features/widgets/user_avatar.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: SafeArea(
        child: Column(
          children: [
            _buildDrawerHeader(),
            const Divider(height: 1, color: lightGray),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.person_outline,
                    title: 'My Profile',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'My Loans',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.history,
                    title: 'Transaction History',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.credit_card_outlined,
                    title: 'Payment Methods',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    badge: '3',
                    onTap: () {},
                  ),
                  const Divider(height: 24, color: lightGray),
                  _buildDrawerItem(
                    context,
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.info_outline,
                    title: 'About',
                    onTap: () {},
                  ),
                  const Divider(height: 24, color: lightGray),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Text(
                        'Version 1.0.0',
                        style: TextStyle(fontSize: 12, color: grayColor),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '© 2025 NJC Cash Zone',
                        style: TextStyle(fontSize: 11, color: grayColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DrawerFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              UserAvatar(image: "assets/images/profile.jpg"),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Kiddo pro dev',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'kiddo257bi@gmail.com',
                      style: TextStyle(fontSize: 13, color: grayColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: accentColor.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Remaining amount',
                      style: TextStyle(fontSize: 11, color: grayColor),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'R 7,510,000.00',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: accentColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Active Loans',
                      style: TextStyle(fontSize: 11, color: grayColor),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '5',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: accentColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? badge,
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isDestructive
              ? redColor.withOpacity(0.1)
              : accentColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: isDestructive ? redColor : accentColor,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: isDestructive ? redColor : blackColor,
        ),
      ),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: redColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: whiteColor,
                ),
              ),
            )
          : Icon(Icons.chevron_right, color: grayColor, size: 20),
      onTap: onTap,
    );
  }
}
