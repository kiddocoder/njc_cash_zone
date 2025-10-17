import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';

class LoanSuccessRequest extends StatelessWidget {
  final String loanType;
  final double amount;
  final String period;

  const LoanSuccessRequest({
    super.key,
    required this.loanType,
    required this.amount,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Decorative circles
            Positioned(
              left: -50,
              top: 200,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: whiteColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: -50,
              top: 300,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: whiteColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: whiteColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                            size: 20,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: () => Navigator.popUntil(
                            context,
                            (route) => route.isFirst,
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: whiteColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.download,
                            color: whiteColor,
                            size: 20,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: accentColor.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: const BoxDecoration(
                                    color: accentColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    color: whiteColor,
                                    size: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          const Text(
                            'Successful',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: blackColor,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Your loan has been submitted, please check\nregularly through this application',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: grayColor,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '13 September, 2025 00:56 PM',
                            style: TextStyle(fontSize: 13, color: grayColor),
                          ),
                          const SizedBox(height: 32),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: lightGray,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFE5E7EB),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: accentColor.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.home_outlined,
                                    color: accentColor,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        loanType,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: blackColor,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        period.replaceAll(
                                              'months',
                                              'years and',
                                            ) +
                                            ' months',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: grayColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Column(
                            children: [
                              const Text(
                                'Total loan',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: grayColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'R ${amount.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800,
                                  color: accentColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
