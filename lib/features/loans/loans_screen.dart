import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';
import 'package:njc_cash_zone/features/loans/widgets/loan_card.dart';
import 'package:njc_cash_zone/features/widgets/floating_new_loan.dart';

class LoansScreen extends StatefulWidget {
  const LoansScreen({super.key});

  @override
  State<LoansScreen> createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 16),
                      child: Text(
                        'My Loans',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: blackColor,
                        ),
                      ),
                    ),
                    _buildFilterChips(),
                    const SizedBox(height: 16),
                  ],
                ),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      Column(
                        children: [
                          LoanCard(
                            id: '1',
                            icon: Icons.school_outlined,
                            title: 'Student loan',
                            duration: '3 months',
                            amount: 'R 1350.00',
                            date: 'May 5, 2025',
                            progress: 0.48,
                          ),
                          const SizedBox(height: 16),
                          LoanCard(
                            id: '2',
                            icon: Icons.directions_car_outlined,
                            title: 'Car loan',
                            duration: '12 months',
                            amount: 'R 2500.00',
                            date: 'May 12, 2025',
                            progress: 0.18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(bottom: 100, right: 20, child: FloatingNewLoan()),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Pending', 'In Progress', 'Completed'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: FilterChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              backgroundColor: whiteColor,
              selectedColor: const Color(0xFFD1FAE5),
              labelStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? accentColor : const Color(0xFF6B7280),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                  color: isSelected ? accentColor : const Color(0xFFE5E7EB),
                  width: 1.5,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            ),
          );
        }).toList(),
      ),
    );
  }
}
