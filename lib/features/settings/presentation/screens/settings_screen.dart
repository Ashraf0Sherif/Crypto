import 'package:crypto_app/core/theme/app_colors.dart';
import 'package:crypto_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/local/secure_storage_service.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _onSignOut(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surfaceContainerHigh,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Sign Out',
          style: AppTextStyles.titleMd.copyWith(color: AppColors.onSurface),
        ),
        content: Text(
          'Are you sure you want to sign out?',
          style: AppTextStyles.bodyMd.copyWith(
            color: AppColors.onSurfaceMuted,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(
              'Cancel',
              style: AppTextStyles.labelMd.copyWith(
                color: AppColors.onSurfaceMuted,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              'Sign Out',
              style: AppTextStyles.labelMd.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await getIt<SecureStorageService>().setLoggedIn(false);
      if (!context.mounted) return;
      context.pushNamedAndRemoveUntil(
        Routes.auth,
        predicate: (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            const SettingsTile(
              icon: Icons.language,
              title: 'Language',
              value: 'English',
            ),
            const SettingsTile(
              icon: Icons.attach_money,
              title: 'Currency',
              value: 'USD',
            ),
            const SettingsTile(
              icon: Icons.brightness_6_outlined,
              title: 'Appearance',
              value: 'Use Device Settings',
            ),
            const SettingsTile(
              icon: Icons.tune,
              title: 'Preference',
              value: 'Customize',
            ),
            const SettingsTile(
              icon: Icons.groups,
              title: 'About Us',
              value: 'v1.2.3',
            ),

            const Spacer(),

            // Sign Out Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _onSignOut(context),
                  icon: const Icon(Icons.logout, size: 20),
                  label: Text(
                    'Sign Out',
                    style: AppTextStyles.titleSm.copyWith(
                      color: AppColors.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: BorderSide(
                      color: AppColors.error.withValues(alpha: 0.4),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
