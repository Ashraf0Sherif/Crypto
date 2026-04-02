import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import 'social_button.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
   return Column(
      children: [
        Center(
          child: Text(
            'Or login with',
            style: AppTextStyles.labelMd.copyWith(color: AppColors.onSurfaceMuted),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: SocialButton(
                icon: Assets.svgs.facebook.path,
                label: 'Facebook',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SocialButton(
                icon: Assets.svgs.google.path,
                label: 'Google',
                onTap: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}