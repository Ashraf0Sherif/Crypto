import 'package:crypto_app/core/theme/app_colors.dart';
import 'package:crypto_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      context.pushReplacementNamed(Routes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.background,
              Color(0xFF1A1040), // subtle purple glow at bottom
            ],
          ),
        ),
        child: Center(child: Assets.images.splash.image()),
      ),
    );
  }
}
