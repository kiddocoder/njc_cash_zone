import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';

class DrawerFooter extends StatelessWidget {
  const DrawerFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Divider(height: 1, color: lightGray),
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: redColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.logout, color: redColor, size: 22),
            ),
            title: Text(
              "Logout",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: redColor,
              ),
            ),
            trailing: Icon(Icons.chevron_right, color: grayColor, size: 20),
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text(
        'Logout',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      content: const Text(
        'Are you sure you want to logout?',
        style: TextStyle(fontSize: 15, color: grayColor),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(color: grayColor, fontWeight: FontWeight.w600),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: redColor,
            foregroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Logout',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}
