import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';

class TopBarIconButton extends StatelessWidget {
  const TopBarIconButton({
    super.key,
    required this.image,
    required this.onTap,
  });

  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: SvgPicture.asset(
            image,
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(
              AppColors.onSurfaceVariant,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
