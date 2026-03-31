import 'dart:ui';
import 'package:crypto_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.useGradientBackground = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool useGradientBackground;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: useGradientBackground
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.onPrimary, AppColors.primaryContainer],
                    )
                  : null,
              color: useGradientBackground ? null : AppColors.background,
              border: Border.all(
                color: AppColors.white.withValues(alpha: .08),
                width: 1,
              ),
            ),
            child: Stack(
              children: [
                if (useGradientBackground)
                  Positioned(
                    right: -15,
                    bottom: -15,
                    child: Icon(
                      icon,
                      size: 100,
                      color: AppColors.white.withValues(alpha: 0.05),
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.primary,
                              AppColors.primaryContainer,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryContainer,
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(icon, color: AppColors.white, size: 28),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: AppTextStyles.headlineSm.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subtitle,
                              style: AppTextStyles.titleSm.copyWith(
                                color: AppColors.white.withValues(alpha: .5),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.white.withValues(alpha: .3),
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
