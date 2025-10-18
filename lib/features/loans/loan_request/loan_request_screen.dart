import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';
import 'package:njc_cash_zone/features/loans/loan_request/loan_payment_methods.dart';

class Agency {
  final String name;
  final String address;
  final String distance;
  final String status;
  final double rating;
  final double lat;
  final double lng;

  Agency({
    required this.name,
    required this.address,
    required this.distance,
    required this.status,
    required this.rating,
    required this.lat,
    required this.lng,
  });
}

class LoanRequestScreen extends StatefulWidget {
  final Agency agency;

  const LoanRequestScreen({super.key, required this.agency});

  @override
  State<LoanRequestScreen> createState() => _RequestLoanScreenState();
}

class _RequestLoanScreenState extends State<LoanRequestScreen> {
  String _selectedLoanType = 'Student loan';
  String _selectedPeriod = '5 months';
  double _loanAmount = 2600;
  bool _isInfoCorrect = false;

  final List<String> loanTypes = [
    'Student loan',
    'Car loan',
    'House loan',
    'Personal loan',
  ];

  final List<String> periods = [
    '3 months',
    '5 months',
    '6 months',
    '12 months',
    '24 months',
  ];

  double get monthlyPayment {
    final months = int.parse(_selectedPeriod.split(' ')[0]);
    final interest = 0.08;
    final totalWithInterest = _loanAmount * (1 + interest);
    return totalWithInterest / months;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProgressBar(),
                    const SizedBox(height: 20),
                    _buildInfoBanner(),
                    const SizedBox(height: 24),
                    _buildLoanNameDropdown(),
                    const SizedBox(height: 20),
                    _buildPeriodDropdown(),
                    const SizedBox(height: 20),
                    _buildAmountInput(),
                    const SizedBox(height: 20),
                    _buildAmountSlider(),
                    const SizedBox(height: 24),
                    _buildCheckbox(),
                    const SizedBox(height: 24),
                    _buildMonthlyPaymentCard(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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

  Widget _buildProgressBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBanner() {
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
              'The calculated amount is approximate. The exact terms of the loans are determinate individually.',
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

  Widget _buildLoanNameDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Loan Name',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: DropdownButton<String>(
            value: _selectedLoanType,
            isExpanded: true,
            underline: const SizedBox(),
            icon: const Icon(Icons.keyboard_arrow_down, color: grayColor),
            items: loanTypes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 15, color: grayColor),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedLoanType = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Period',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: DropdownButton<String>(
            value: _selectedPeriod,
            isExpanded: true,
            underline: const SizedBox(),
            icon: const Icon(Icons.keyboard_arrow_down, color: grayColor),
            items: periods.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 15, color: grayColor),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedPeriod = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'How Much Money You Need ?',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: _loanAmount.toInt().toString(),
            hintStyle: const TextStyle(color: grayColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: accentColor, width: 2),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              setState(() {
                _loanAmount = double.tryParse(value) ?? _loanAmount;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildAmountSlider() {
    return Column(
      children: [
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: accentColor,
            inactiveTrackColor: accentColor.withOpacity(0.2),
            thumbColor: accentColor,
            overlayColor: accentColor.withOpacity(0.2),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
            trackHeight: 6,
          ),
          child: Slider(
            value: _loanAmount,
            min: 2600,
            max: 20000,
            onChanged: (value) {
              setState(() {
                _loanAmount = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('R 2600', style: TextStyle(fontSize: 13, color: grayColor)),
              Text('R 20000', style: TextStyle(fontSize: 13, color: grayColor)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isInfoCorrect = !_isInfoCorrect;
        });
      },
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(
                color: _isInfoCorrect ? accentColor : grayColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(6),
              color: _isInfoCorrect ? accentColor : Colors.transparent,
            ),
            child: _isInfoCorrect
                ? const Icon(Icons.check, size: 16, color: whiteColor)
                : null,
          ),
          const SizedBox(width: 12),
          const Text(
            'The Information Are Correct',
            style: TextStyle(fontSize: 14, color: blackColor),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyPaymentCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'How Much Money You Need ?',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: accentColor.withOpacity(0.3),
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            children: [
              const Text(
                'Monthly Payment',
                style: TextStyle(fontSize: 14, color: grayColor),
              ),
              const SizedBox(height: 8),
              Text(
                'R ${monthlyPayment.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: accentColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '8% Interest',
                style: TextStyle(fontSize: 14, color: redColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNextButton() {
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
          onPressed: _isInfoCorrect
              ? () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => LoanSuccessRequest(
                  //       loanType: _selectedLoanType,
                  //       amount: _loanAmount,
                  //       period: _selectedPeriod,
                  //     ),
                  //   ),
                  // );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoanPaymentMethods(),
                    ),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor,
            foregroundColor: whiteColor,
            disabledBackgroundColor: grayColor.withOpacity(0.3),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Next',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
