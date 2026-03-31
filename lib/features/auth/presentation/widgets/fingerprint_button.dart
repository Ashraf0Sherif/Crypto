import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class FingerprintButton extends StatelessWidget {
  const FingerprintButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.fingerprint, color: AppColors.primary, size: 28),
          const SizedBox(width: 12),
          Text(
            'Use fingerprint instead?',
            style: AppTextStyles.bodyMd.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
