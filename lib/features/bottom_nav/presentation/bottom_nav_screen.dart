import 'package:crypto_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../logic/bottom_nav_cubit.dart';
import 'widgets/custom_bottom_nav_bar.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          BlocBuilder<BottomNavCubit, NavItemType>(
            builder: (context, state) {
              return IndexedStack(
                index: state.index,
                children: NavItemType.values
                    .map((type) => type.screen)
                    .toList(),
              );
            },
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
