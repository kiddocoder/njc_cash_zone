import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:njc_cash_zone/features/auth/authentification/login.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: 300,
                height: 300,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: SuccessAnimationPainter(
                        animation: _animationController,
                      ),
                      child: child,
                    );
                  },
                  child: Center(
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD1FAE5),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(30),
                        decoration: const BoxDecoration(
                          color: Color(0xFF10B981),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              const Text(
                'OTP Verified',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Your email number has been\nverified successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF9CA3AF),
                  height: 1.5,
                ),
              ),
              const Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessAnimationPainter extends CustomPainter {
  final Animation<double> animation;

  SuccessAnimationPainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..style = PaintingStyle.fill;

    // Animated confetti particles
    for (int i = 0; i < 20; i++) {
      final angle = (i / 20) * 2 * math.pi;
      final distance = 120 + (animation.value * 30);
      final x =
          center.dx +
          math.cos(angle + animation.value * 2 * math.pi) * distance;
      final y =
          center.dy +
          math.sin(angle + animation.value * 2 * math.pi) * distance;

      // Different colors for confetti
      if (i % 3 == 0) {
        paint.color = const Color(0xFF10B981);
      } else if (i % 3 == 1) {
        paint.color = const Color(0xFFEF4444);
      } else {
        paint.color = const Color(0xFFD1D5DB);
      }

      // Different shapes
      if (i % 4 == 0) {
        canvas.drawCircle(Offset(x, y), 4, paint);
      } else {
        canvas.drawRect(
          Rect.fromCenter(center: Offset(x, y), width: 6, height: 6),
          paint,
        );
      }
    }

    // Curved lines
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = const Color(0xFFD1D5DB);

    for (int i = 0; i < 8; i++) {
      final angle = (i / 8) * 2 * math.pi;
      final startDistance = 140;
      final endDistance = 160;

      final startX =
          center.dx +
          math.cos(angle + animation.value * 2 * math.pi) * startDistance;
      final startY =
          center.dy +
          math.sin(angle + animation.value * 2 * math.pi) * startDistance;
      final endX =
          center.dx +
          math.cos(angle + animation.value * 2 * math.pi) * endDistance;
      final endY =
          center.dy +
          math.sin(angle + animation.value * 2 * math.pi) * endDistance;

      final path = Path();
      path.moveTo(startX, startY);
      path.quadraticBezierTo(
        (startX + endX) / 2 + 10,
        (startY + endY) / 2,
        endX,
        endY,
      );
      canvas.drawPath(path, linePaint);
    }
  }

  @override
  bool shouldRepaint(SuccessAnimationPainter oldDelegate) => true;
}
