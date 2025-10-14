import "package:flutter/material.dart";

class AccessLoan extends StatelessWidget {
  const AccessLoan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Welcome to the Loan App 👋',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
