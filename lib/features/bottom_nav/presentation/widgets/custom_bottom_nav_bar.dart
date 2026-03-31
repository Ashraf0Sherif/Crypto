import 'dart:ui';
import 'package:crypto_app/features/bottom_nav/logic/bottom_nav_cubit.dart';
import 'package:crypto_app/features/bottom_nav/presentation/widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, NavItemType>(
      builder: (context, activeTab) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                color: AppColors.surface.withValues(alpha: .7),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: .2),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: .15),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: NavItemType.values.map((type) {
                  return NavItem(type: type);
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
