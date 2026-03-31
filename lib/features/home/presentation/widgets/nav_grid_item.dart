import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class NavGridItem extends StatelessWidget {
  const NavGridItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final String icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 62,
                height: 62,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.labelSm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
