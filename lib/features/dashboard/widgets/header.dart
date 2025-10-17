import 'package:flutter/material.dart';
import 'package:njc_cash_zone/features/dashboard/widgets/customer_drawer.dart';
import 'package:njc_cash_zone/features/widgets/user_avatar.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _drawerOffsetAnimation;
  OverlayEntry? _drawerOverlay;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );

    _drawerOffsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _showDrawer() {
    if (_drawerOverlay != null) return;

    _drawerOverlay = OverlayEntry(
      builder: (context) => Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Background dim layer
            GestureDetector(
              onTap: _closeDrawer,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            // Sliding drawer
            SlideTransition(
              position: _drawerOffsetAnimation,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height,
                  child: const CustomerDrawer(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    Overlay.of(context).insert(_drawerOverlay!);
    _controller.forward();
  }

  void _closeDrawer() async {
    await _controller.reverse();
    _drawerOverlay?.remove();
    _drawerOverlay = null;
  }

  @override
  void dispose() {
    _controller.dispose();
    _drawerOverlay?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: _showDrawer,
            child: UserAvatar(image: "assets/images/profile.jpg"),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Kiddo',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  'Ready to manage your loans today?',
                  style: TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/notifications'),
                  icon: const Icon(Icons.notifications_none),
                  color: const Color(0xFF6B7280),
                  iconSize: 22,
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Color(0xFF65B947),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
