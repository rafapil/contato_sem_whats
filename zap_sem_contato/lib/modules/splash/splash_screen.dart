import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zap_sem_contato/shared/themes/app_colors.dart';
import 'package:zap_sem_contato/shared/themes/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, '/message', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset(
          AppImages.logoImageApp,
          height: 180,
        ),
      ),
    );
  }
}
