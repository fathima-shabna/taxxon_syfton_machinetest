import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(
          'assets/logo.jpg',
          width: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
