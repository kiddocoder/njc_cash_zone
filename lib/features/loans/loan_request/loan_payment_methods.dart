import 'package:flutter/material.dart';

class LoanPaymentMethods extends StatefulWidget {
  const LoanPaymentMethods({Key? key}) : super(key: key);

  @override
  State<LoanPaymentMethods> createState() => _LoanPaymentMethodsState();
}

class _LoanPaymentMethodsState extends State<LoanPaymentMethods> {
  final TextEditingController _purposeController = TextEditingController();
  final TextEditingController _cardholderController = TextEditingController();

  String _selectedBillingAddress = 'South Africa';
  String _selectedPaymentMethod = 'mastercard';
  String _selectedBank = '';

  final List<String> countries = [
    'South Africa',
    'Kenya',
    'Nigeria',
    'Ghana',
    'Tanzania',
  ];

  @override
  void initState() {
    super.initState();
    _purposeController.text = 'I want to pay the school for my child';
    _cardholderController.text = 'Iradukunda Toussaint';
  }

  @override
  void dispose() {
    _purposeController.dispose();
    _cardholderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _buildProgressBar(currentStep: 2),
                  const SizedBox(height: 20),
                  _buildInfoBanner(
                    'Repayment will be automatically collected from debit card linked to your account',
                  ),
                  const SizedBox(height: 24),
                  _buildTextField(
                    label: 'Purpose Of Loan',
                    controller: _purposeController,
                    hint: 'Enter loan purpose',
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    label: 'Cardholder Name',
                    controller: _cardholderController,
                    hint: 'Enter cardholder name',
                  ),
                  const SizedBox(height: 20),
                  _buildDropdownField(
                    label: 'Billing Address',
                    value: _selectedBillingAddress,
                    items: countries,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedBillingAddress = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  _buildSectionHeader('Select Payment', showAddButton: true),
                  const SizedBox(height: 12),
                  _buildPaymentOption(
                    id: 'mastercard',
                    name: 'MasterCard',
                    number: '**** **** 2530',
                    icon: Icons.credit_card,
                    iconColor: const Color(0xFFEB001B),
                  ),
                  const SizedBox(height: 12),
                  _buildPaymentOption(
                    id: 'creditcard',
                    name: 'Credit Card',
                    number: '**** **** 2530',
                    icon: Icons.credit_card,
                    iconColor: const Color(0xFFE8C37D),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Use Locals',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildBankOption(
                    id: 'fnb',
                    name: 'FNB',
                    logo: 'FNB',
                    logoColor: const Color(0xFF007FA3),
                  ),
                  const SizedBox(height: 12),
                  _buildBankOption(
                    id: 'standard',
                    name: 'Standard Bank',
                    logo: 'Standard Bank',
                    logoColor: const Color(0xFF0033A0),
                  ),
                  const SizedBox(height: 12),
                  _buildBankOption(
                    id: 'absa',
                    name: 'ABSA',
                    logo: 'ABSA',
                    logoColor: const Color(0xFFE30613),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            _buildNextButton(context),
          ],
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
              color: const Color(0xFF65B947),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              padding: EdgeInsets.zero,
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Request Loan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
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
              color: isActive
                  ? const Color(0xFF65B947)
                  : const Color(0xFF65B947).withOpacity(0.3),
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
        color: const Color(0xFFE8C37D).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8C37D).withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: const Color(0xFFE8C37D).withOpacity(0.8),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.7),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
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
              borderSide: const BorderSide(color: Color(0xFF65B947), width: 2),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFFBDBDBD),
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFFBDBDBD),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, {bool showAddButton = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        if (showAddButton)
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Add Card'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF65B947),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
          ),
      ],
    );
  }

  Widget _buildPaymentOption({
    required String id,
    required String name,
    required String number,
    required IconData icon,
    required Color iconColor,
  }) {
    final isSelected = _selectedPaymentMethod == id;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = id;
          _selectedBank = '';
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF65B947)
                : const Color(0xFFE5E7EB),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF65B947)
                      : const Color(0xFFBDBDBD),
                  width: 2,
                ),
                color: isSelected
                    ? const Color(0xFF65B947)
                    : Colors.transparent,
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.circle, size: 10, color: Colors.white),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    number,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFBDBDBD),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankOption({
    required String id,
    required String name,
    required String logo,
    required Color logoColor,
  }) {
    final isSelected = _selectedBank == id;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedBank = id;
          _selectedPaymentMethod = '';
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF65B947)
                : const Color(0xFFE5E7EB),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF65B947)
                      : const Color(0xFFBDBDBD),
                  width: 2,
                ),
                color: isSelected
                    ? const Color(0xFF65B947)
                    : Colors.transparent,
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.circle, size: 10, color: Colors.white),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: logoColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  logo.isNotEmpty ? logo.substring(0, 1) : '',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: logoColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    final isValid =
        _selectedPaymentMethod.isNotEmpty || _selectedBank.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: isValid
              ? () {
                  // Navigate to next screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Proceeding to next step...'),
                      backgroundColor: Color(0xFF65B947),
                    ),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF65B947),
            foregroundColor: Colors.white,
            disabledBackgroundColor: const Color(0xFFBDBDBD).withOpacity(0.3),
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
