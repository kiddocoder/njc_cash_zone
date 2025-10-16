import 'package:flutter/material.dart';
import 'package:njc_cash_zone/features/chats/discussions.dart';
import 'package:njc_cash_zone/features/dashboard/dashboard.dart';
import 'package:njc_cash_zone/features/history/history_screen.dart';
import 'package:njc_cash_zone/features/loans/loans_screen.dart';
import 'package:njc_cash_zone/features/profile/profile_screen.dart';
import 'package:njc_cash_zone/features/widgets/floating_navbar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DashboardScreen(),
    LoansScreen(),
    DiscussionsScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    setState(() => _selectedIndex = index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // 👈 allows navbar to float over body
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) => setState(() => _selectedIndex = index),
            children: _pages,
          ),
          Positioned(
            bottom: 16,
            left: 10,
            right: 10,
            child: FloatingNavbar(
              activeIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }
}
