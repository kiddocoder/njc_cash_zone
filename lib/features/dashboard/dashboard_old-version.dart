import 'package:flutter/material.dart';
import 'package:njc_cash_zone/features/dashboard/recent_loans.dart';
import 'package:njc_cash_zone/features/dashboard/widgets/action_button.dart';
import 'package:njc_cash_zone/features/widgets/floating_new_loan.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 165),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildLoanCard(),
                  const SizedBox(height: 24),
                  _buildActionButtons(),
                  const SizedBox(height: 24),
                  RecentLoans(),
                  const SizedBox(height: 24),
                  _buildRecentActivities(),
                ],
              ),
            ),

            Positioned(bottom: 105, right: 20, child: FloatingNewLoan()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 24,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hi, Kiddo',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Ready to manage your loans today?',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: Color(0xFF6B7280),
                  size: 22,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF65B947),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoanCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/bg-hero-texture.png'),
          fit: BoxFit.cover,
        ),
        color: const Color(0xFF65B947),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'R 3,150,000.00',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Next repayment Sept 12, 2025',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account ID',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '**** **** 1250',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Status',
              //         style: TextStyle(
              //           fontSize: 11,
              //           color: Colors.white.withOpacity(0.8),
              //         ),
              //       ),
              //       const SizedBox(height: 4),
              //       Container(
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 10,
              //           vertical: 4,
              //         ),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(12),
              //           border: Border.all(
              //             color: Colors.white.withOpacity(0.4),
              //             width: 1,
              //           ),
              //         ),
              //         child: const Text(
              //           'active',
              //           style: TextStyle(fontSize: 11, color: Colors.white),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8C37D),
                    foregroundColor: const Color(0xFFFFFFFF),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: const BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Make Payment',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ActionButton(
            icon: "assets/icons/map-pinned.png",
            label: 'Agencies',
            color: const Color(0xFF65B947),
          ),
          ActionButton(
            icon: "assets/icons/borrow_svgrepo.png",
            label: 'Upload Docs',
            color: const Color(0xFF65B947),
          ),
          ActionButton(
            icon: "assets/icons/borrow_svgrepo.png",
            label: 'Chat Support',
            color: const Color(0xFF65B947),
          ),
          ActionButton(
            icon: "assets/icons/borrow_svgrepo.png",
            label: 'Loan History',
            color: const Color(0xFF65B947),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Activities',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
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
                    color: Color(0xFF65B947),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildActivityItem(
            icon: Icons.trending_up,
            title: 'Loan Request Submitted',
            time: 'Today 1:53 PM',
            amount: '+R 5,000.00',
            amountColor: const Color(0xFF65B947),
          ),
          const SizedBox(height: 12),
          _buildActivityItem(
            icon: Icons.chat_bubble_outline,
            title: 'Message from Support',
            time: 'Today 1:53 PM',
            badge: 'unread',
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String time,
    String? amount,
    Color? amountColor,
    String? badge,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFD1FAE5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF65B947), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
          if (amount != null)
            Text(
              amount,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: amountColor,
              ),
            ),
          if (badge != null)
            Text(
              badge,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFFEF4444),
              ),
            ),
        ],
      ),
    );
  }
}
