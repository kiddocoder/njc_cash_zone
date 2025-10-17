import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';
import 'package:njc_cash_zone/features/loans/widgets/pay_loan_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoanDetailsScreen extends StatefulWidget {
  const LoanDetailsScreen({super.key});

  @override
  State<LoanDetailsScreen> createState() => _LoanDetailsScreenState();
}

class _LoanDetailsScreenState extends State<LoanDetailsScreen> {
  final PanelController _pc = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SlidingUpPanel(
          controller: _pc,
          minHeight: 0,
          maxHeight: 650,
          backdropEnabled: true,
          border: const Border(
            top: BorderSide(color: Color(0xFFE5E7EB), width: 1),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          panel: PayLoanPanel(),
          body: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProgressCircle(),
                      const SizedBox(height: 24),
                      _buildLoanHeader(),
                      const SizedBox(height: 24),
                      _buildBalanceCards(),
                      const SizedBox(height: 24),
                      _buildRepaymentProgress(),
                      const SizedBox(height: 24),
                      _buildLoanDetails(),
                      const SizedBox(height: 24),
                      _buildPaymentsHistory(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              _buildPayOffButton(),
            ],
          ),
        ),
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
            'Loan Details',
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

  Widget _buildProgressCircle() {
    return Center(
      child: SizedBox(
        width: 120,
        height: 120,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: CircularProgressIndicator(
                value: 0.48,
                strokeWidth: 12,
                backgroundColor: lightGray,
                valueColor: AlwaysStoppedAnimation<Color>(
                  primaryColor.withOpacity(0.6),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: 0.48,
                strokeWidth: 10,
                backgroundColor: Colors.transparent,
                valueColor: const AlwaysStoppedAnimation<Color>(accentColor),
              ),
            ),
            const Text(
              '48%',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoanHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.school_outlined,
            color: accentColor,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'Student loan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: blackColor,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor.withOpacity(0.4), width: 1),
          ),
          child: Text(
            'active',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: primaryColor.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'R 5000',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: blackColor,
                ),
              ),
              TextSpan(
                text: ' borrowed',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: grayColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: accentColor.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Remaining Balance',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: darkGray,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'R 2,800',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: primaryColor.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Next Payment',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: darkGray,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'R 800',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRepaymentProgress() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Repayment Progress',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            Text(
              '52%',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: blackColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: 0.52,
            minHeight: 8,
            backgroundColor: lightGray,
            valueColor: const AlwaysStoppedAnimation<Color>(accentColor),
          ),
        ),
      ],
    );
  }

  Widget _buildLoanDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildDetailRow('Amount', 'R 3620.00'),
          const SizedBox(height: 12),
          _buildDetailRow('Interest rate/month', '8%'),
          const SizedBox(height: 12),
          _buildDetailRow('Period', '12 Years'),
          const SizedBox(height: 12),
          _buildDetailRow('Agreement date', '08/01/2025'),
          const SizedBox(height: 12),
          _buildDetailRow('Monthly payment', 'R 256.00'),
          const SizedBox(height: 16),
          const Divider(color: grayColor, height: 1),
          const SizedBox(height: 16),
          _buildDetailRow(
            'Total',
            'R 3620.00',
            isBold: true,
            valueColor: accentColor,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
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
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            color: blackColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
            color: valueColor ?? blackColor,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentsHistory() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Payments history',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'See All',
                style: TextStyle(
                  color: accentColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.trending_up,
                  color: accentColor,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Loan Request Submitted',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Today 1:53 PM',
                      style: TextStyle(fontSize: 12, color: grayColor),
                    ),
                  ],
                ),
              ),
              const Text(
                '+R 5,000.00',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: accentColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPayOffButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(color: whiteColor),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () => _pc.open(),
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            foregroundColor: whiteColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Pay off',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
