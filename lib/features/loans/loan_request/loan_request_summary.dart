import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';

class LoanRequestSummary extends StatelessWidget {
  const LoanRequestSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressBar(currentStep: 3),
                  const SizedBox(height: 20),
                  _buildInfoBanner(
                    'Early and one time payments increase your loan limit and makes you eligible for the higher amount',
                  ),
                  const SizedBox(height: 24),
                  _buildSelectedCard(),
                  const SizedBox(height: 24),
                  _buildSummaryRow('Amount', 'R 3620.00'),
                  const SizedBox(height: 16),
                  _buildSummaryRow('Interest rate/month', '8%'),
                  const SizedBox(height: 16),
                  _buildSummaryRow('Period', '12 Years'),
                  const SizedBox(height: 16),
                  _buildSummaryRow('Agreement date', '08/01/2025'),
                  const SizedBox(height: 16),
                  _buildSummaryRow('Monthly payment', 'R 256.00'),
                  const SizedBox(height: 20),
                  const Divider(color: grayColor, height: 1),
                  const SizedBox(height: 20),
                  _buildSummaryRow(
                    'Total',
                    'R 3620.00',
                    isBold: true,
                    valueColor: accentColor,
                  ),
                ],
              ),
            ),
          ),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: whiteColor, size: 20),
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Request Loan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: blackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar({required int currentStep}) {
    return Row(
      children: List.generate(3, (index) {
        final isActive = index < currentStep;
        return Expanded(
          child: Container(
            height: 6,
            margin: EdgeInsets.only(right: index < 2 ? 8 : 0),
            decoration: BoxDecoration(
              color: isActive ? accentColor : accentColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildInfoBanner(String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: primaryColor.withOpacity(0.8),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: blackColor.withOpacity(0.7),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            // Navigate to success screen
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            foregroundColor: whiteColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Submit',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.credit_card,
              color: primaryColor.withOpacity(0.8),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Credit Card',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: blackColor,
                ),
              ),
              SizedBox(height: 2),
              Text(
                '**** **** 2530',
                style: TextStyle(fontSize: 13, color: grayColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildSummaryRow(
  String label,
  String value, {
  bool isBold = false,
  Color? valueColor,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          color: blackColor,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 15,
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
          color: valueColor ?? blackColor,
        ),
      ),
    ],
  );
}
