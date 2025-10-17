import 'package:flutter/material.dart';
import 'package:njc_cash_zone/features/chats/discussions.dart';
import 'package:njc_cash_zone/features/dashboard/dashboard.dart';
import 'package:njc_cash_zone/features/history/history_screen.dart';
import 'package:njc_cash_zone/features/loans/loans_screen.dart';
import 'package:njc_cash_zone/features/profile/profile_screen.dart';
import 'package:njc_cash_zone/features/states/globals.dart';
import 'package:njc_cash_zone/features/widgets/floating_navbar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late PageController _pageController = PageController();

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
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    mainLayoutIndexNotifier.value = index; // update global state
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = mainLayoutIndexNotifier.value; // get current value
    _pageController = PageController(initialPage: _selectedIndex);

    mainLayoutIndexNotifier.addListener(_onGlobalIndexChanged);
  }

  void _onGlobalIndexChanged() {
    final index = mainLayoutIndexNotifier.value;
    if (index != _selectedIndex) {
      _pageController.jumpToPage(index);
      setState(() => _selectedIndex = index);
    }
  }

  @override
  void dispose() {
    mainLayoutIndexNotifier.removeListener(() {});
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
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
