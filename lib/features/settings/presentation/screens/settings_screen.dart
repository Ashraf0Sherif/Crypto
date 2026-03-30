import 'package:crypto/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/settings_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
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
          ],
        ),
      ),
    );
  }
}
