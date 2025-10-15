import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';
import 'package:njc_cash_zone/features/widgets/floating_navbar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool _showFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _buildSearchBar(),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 100, top: 8),
                    children: [
                      _buildHistoryItem(
                        icon: Icons.school_outlined,
                        title: 'Student loan',
                        duration: '3 months',
                        amount: 'R 1350.00',
                        date: 'May 5, 2025',
                        isApproved: true,
                      ),
                      const SizedBox(height: 12),
                      _buildHistoryItem(
                        icon: Icons.directions_car_outlined,
                        title: 'Car loan',
                        duration: '12 months',
                        amount: 'R 2500.00',
                        date: 'May 12, 2025',
                        isApproved: true,
                      ),
                      const SizedBox(height: 12),
                      _buildHistoryItem(
                        icon: Icons.home_outlined,
                        title: 'House Loan',
                        duration: '12 months',
                        amount: 'R 6000.00',
                        date: 'April 03, 2024',
                        isApproved: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 10,
              right: 10,
              child: FloatingNavbar(activeIndex: 3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB), width: 1.5),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: grayColor, size: 22),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search a discusion',
                        hintStyle: TextStyle(color: grayColor, fontSize: 15),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.filter_list, color: whiteColor, size: 24),
              onPressed: () {
                setState(() {
                  _showFilter = !_showFilter;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem({
    required IconData icon,
    required String title,
    required String duration,
    required String amount,
    required String date,
    required bool isApproved,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: accentColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Icon(icon, color: accentColor, size: 28),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      duration,
                      style: const TextStyle(fontSize: 13, color: grayColor),
                    ),
                  ],
                ),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: accentColor, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: lightGray,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: blackColor,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 13, color: grayColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
