import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.placeholder,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.onToggleVisibility,
  });

  final TextEditingController controller;
  final String placeholder;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onToggleVisibility;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && !isPasswordVisible,
      style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurface),
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: AppTextStyles.bodyMd.copyWith(
          color: AppColors.onSurfaceMuted,
        ),
        filled: true,
        fillColor: AppColors.surfaceContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.onSurfaceMuted,
                  size: 20,
                ),
                onPressed: onToggleVisibility,
              )
            : null,
      ),
    );
  }
}
