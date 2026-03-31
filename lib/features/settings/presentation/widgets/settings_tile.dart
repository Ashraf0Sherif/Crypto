import 'package:crypto_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: AppColors.secondary, size: 22),
            const SizedBox(width: 14),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(color: AppColors.lightGrey, fontSize: 13),
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.lightGrey,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
