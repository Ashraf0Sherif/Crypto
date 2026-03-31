
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required bool isSignIn,
  }) : _isSignIn = isSignIn;

  final bool _isSignIn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _isSignIn
            ? Text('Welcome Back', style: AppTextStyles.displaySm)
            : RichText(
                text: TextSpan(
                  style: AppTextStyles.displaySm,
                  children: [
                    const TextSpan(text: 'Join the '),
                    TextSpan(
                      text: 'Expedition',
                      style: AppTextStyles.displaySm.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
        Text(
          _isSignIn
              ? 'Access your celestial digital assets'
              : 'Secure your seat in the future of finance.',
          style: AppTextStyles.bodyMd.copyWith(
            color: AppColors.onSurfaceMuted,
          ),
        ),
      ],
    );
  }
}
