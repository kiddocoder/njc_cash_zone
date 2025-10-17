import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';
import 'package:njc_cash_zone/features/loans/loan_request/loan_request_screen.dart';

// Agencies Map Screen
class AgenciesMapScreen extends StatefulWidget {
  const AgenciesMapScreen({super.key});

  @override
  State<AgenciesMapScreen> createState() => _AgenciesMapScreenState();
}

class _AgenciesMapScreenState extends State<AgenciesMapScreen> {
  Agency? _selectedAgency;
  final TextEditingController _searchController = TextEditingController();

  final List<Agency> agencies = [
    Agency(
      name: 'Agency Johannesburg Central',
      address: '123 Commissioner Street, Johannesburg CBD',
      distance: '2.1 km away',
      status: 'Open Now (closes 17:00)',
      rating: 4.0,
      lat: -26.2041,
      lng: 28.0473,
    ),
    Agency(
      name: 'Agency Sandton',
      address: '45 Rivonia Road, Sandton',
      distance: '5.3 km away',
      status: 'Open Now (closes 18:00)',
      rating: 4.5,
      lat: -26.1076,
      lng: 28.0567,
    ),
    Agency(
      name: 'Agency Rosebank',
      address: '12 Oxford Road, Rosebank',
      distance: '3.8 km away',
      status: 'Open Now (closes 17:30)',
      rating: 4.2,
      lat: -26.1464,
      lng: 28.0436,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _selectAgency(Agency agency) {
    setState(() {
      _selectedAgency = agency;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map Background (Simulated)
          Container(
            decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
            child: CustomPaint(painter: MapPainter(), size: Size.infinite),
          ),

          // Agency Markers
          ...agencies.map((agency) => _buildMarker(agency)),

          // Search Bar
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: blackColor.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: blackColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Enter the agency name...',
                        hintStyle: TextStyle(color: grayColor, fontSize: 14),
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: grayColor),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Sliding Panel
          if (_selectedAgency != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildAgencyPanel(_selectedAgency!),
            ),
        ],
      ),
    );
  }

  Widget _buildMarker(Agency agency) {
    final isSelected = _selectedAgency?.name == agency.name;

    return Positioned(
      top: 200 + agencies.indexOf(agency) * 80.0,
      left: 50 + (agencies.indexOf(agency) % 3) * 100.0,
      child: GestureDetector(
        onTap: () => _selectAgency(agency),
        child: Column(
          children: [
            Container(
              width: isSelected ? 60 : 50,
              height: isSelected ? 60 : 50,
              decoration: BoxDecoration(
                color: isSelected ? accentColor : accentColor.withOpacity(0.8),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(0.3),
                    blurRadius: isSelected ? 12 : 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.location_on, color: whiteColor, size: 30),
            ),
            if (isSelected) Container(width: 3, height: 20, color: accentColor),
          ],
        ),
      ),
    );
  }

  Widget _buildAgencyPanel(Agency agency) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: lightGray,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 160,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: lightGray,
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage('https://via.placeholder.com/400x200'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    agency.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: primaryColor, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      agency.rating.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: grayColor,
                  size: 18,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    agency.address,
                    style: const TextStyle(fontSize: 13, color: grayColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: accentColor.withOpacity(0.3)),
                  ),
                  child: const Text(
                    'Support',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: accentColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  agency.status,
                  style: const TextStyle(fontSize: 13, color: grayColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoanRequestScreen(agency: agency),
                    ),
                  );
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
                  'Select',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// Map Painter (Simulated Map)
class MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE0E0E0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Draw grid lines to simulate map
    for (double i = 0; i < size.width; i += 50) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += 50) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    // Draw some "roads"
    final roadPaint = Paint()
      ..color = const Color(0xFFBDBDBD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawLine(
      Offset(0, size.height * 0.3),
      Offset(size.width, size.height * 0.4),
      roadPaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.2, 0),
      Offset(size.width * 0.3, size.height),
      roadPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Request Loan Screen
