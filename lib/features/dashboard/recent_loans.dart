import 'package:flutter/material.dart';
import 'package:njc_cash_zone/features/loans/widgets/loan_card.dart';
import 'package:njc_cash_zone/features/states/globals.dart';

class RecentLoans extends StatelessWidget {
  const RecentLoans({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent loans',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {
                  mainLayoutIndexNotifier.value = 1;
                  Navigator.pushNamed(context, '/main');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: Color(0xFF65B947),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          LoanCard(
            id: '1',
            icon: Icons.school_outlined,
            title: 'Student loan',
            duration: '3 months',
            amount: 'R 1350.00',
            date: 'May 5, 2025',
            progress: 0.48,
          ),
        ],
      ),
    );
  }
}
