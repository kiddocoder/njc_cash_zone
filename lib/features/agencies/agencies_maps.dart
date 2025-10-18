import 'package:flutter/material.dart';
import 'package:njc_cash_zone/core/constants/colors.dart';
import 'package:njc_cash_zone/features/loans/loan_request/loan_request_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'widgets/select_agency_panel.dart';

// Agencies Map Screen
class AgenciesMapScreen extends StatelessWidget {
  const AgenciesMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Agency> selectedAgency = ValueNotifier(
      Agency(
        name: 'Agency Johannesburg Central',
        address: '123 Commissioner Street, Johannesburg CBD',
        distance: '2.1 km away',
        status: 'Open Now (closes 17:00)',
        rating: 4.0,
        lat: -26.2041,
        lng: 28.0473,
      ),
    );

    final TextEditingController searchController = TextEditingController();
    final PanelController panelController = PanelController();

    // final List<Agency> agencies = [
    //   Agency(
    //     name: 'Agency Johannesburg Central',
    //     address: '123 Commissioner Street, Johannesburg CBD',
    //     distance: '2.1 km away',
    //     status: 'Open Now (closes 17:00)',
    //     rating: 4.0,
    //     lat: -26.2041,
    //     lng: 28.0473,
    //   ),
    //   Agency(
    //     name: 'Agency Sandton',
    //     address: '45 Rivonia Road, Sandton',
    //     distance: '5.3 km away',
    //     status: 'Open Now (closes 18:00)',
    //     rating: 4.5,
    //     lat: -26.1076,
    //     lng: 28.0567,
    //   ),
    //   Agency(
    //     name: 'Agency Rosebank',
    //     address: '12 Oxford Road, Rosebank',
    //     distance: '3.8 km away',
    //     status: 'Open Now (closes 17:30)',
    //     rating: 4.2,
    //     lat: -26.1464,
    //     lng: 28.0436,
    //   ),
    // ];

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<Agency>(
          valueListenable: selectedAgency,
          builder: (context, agency, _) {
            return SlidingUpPanel(
              controller: panelController,
              minHeight: 0,
              maxHeight: 420,
              backdropEnabled: true,
              border: const Border(
                top: BorderSide(color: Color(0xFFE5E7EB), width: 1),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              panel: SelectAgencyPanel(agency: agency),
              body: Stack(
                children: [
                  // Map Background (Simulated)
                  Container(
                    decoration: const BoxDecoration(color: Color(0xFFF0F0F0)),
                    child: CustomPaint(
                      painter: MapPainter(),
                      size: Size.infinite,
                    ),
                  ),

                  // Agency Markers
                  Positioned(
                    top: 200 + selectedAgency.value.hashCode % 3 * 80.0,
                    left: 50 + (selectedAgency.value.hashCode % 3) * 100.0,
                    child: GestureDetector(
                      onTap: () => panelController.open(),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: accentColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: accentColor.withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.location_on,
                              color: whiteColor,
                              size: 30,
                            ),
                          ),
                          Container(width: 3, height: 20, color: accentColor),
                        ],
                      ),
                    ),
                  ),

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
                            icon: const Icon(
                              Icons.arrow_back,
                              color: blackColor,
                            ),
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
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: 'Enter the agency name...',
                                hintStyle: TextStyle(
                                  color: grayColor,
                                  fontSize: 14,
                                ),
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
                ],
              ),
            );
          },
        ),
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
