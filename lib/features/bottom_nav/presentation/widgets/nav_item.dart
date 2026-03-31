import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../logic/bottom_nav_cubit.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.type,
  });

  final NavItemType type;

  @override
  Widget build(BuildContext context) {
    final isSelected = context.select<BottomNavCubit, bool>(
      (cubit) => cubit.state == type,
    );

    return GestureDetector(
      onTap: () => context.read<BottomNavCubit>().updateTab(type),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: SvgPicture.asset(
                type.iconPath,
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.primary : AppColors.onSurfaceMuted,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              type.label,
              style: AppTextStyles.labelSm.copyWith(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                color: isSelected ? AppColors.primary : AppColors.onSurfaceMuted,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(top: 4),
              height: 3,
              width: isSelected ? 12 : 0,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}