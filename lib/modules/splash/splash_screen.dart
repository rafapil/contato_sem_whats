import 'dart:async';
import 'package:flutter/material.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_strings.dart' as app_strings;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, '/message', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.chat,
                size: 80,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              app_strings.AppStrings.appTitle,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              app_strings.AppStrings.appVersion,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.white.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
