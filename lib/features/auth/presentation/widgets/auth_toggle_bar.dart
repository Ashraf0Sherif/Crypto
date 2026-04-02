import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'auth_toggle_button.dart';

class AuthToggleBar extends StatelessWidget {
  const AuthToggleBar({super.key, required this.isSignIn, required this.onToggle});

  final bool isSignIn;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
     return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: AuthToggleButton(
              title: 'Sign in',
              isSelected: isSignIn,
              onTap: onToggle,
            ),
          ),
          Expanded(
            child: AuthToggleButton(
              title: 'Sign up',
              isSelected: !isSignIn,
              onTap: onToggle,
            ),
          ),
        ],
      ),
    );
  }
}