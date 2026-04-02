import 'package:crypto_app/features/home/presentation/widgets/action_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/lottie_loader.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import '../widgets/coin_section.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/nav_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return switch (state) {
              HomeLoading() => const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 100.0),
                  child: LottieLoader(),
                ),
              ),
              HomeError(message: var msg) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                        size: 48,
                      ),
                      const SizedBox(height: 16),
                      Text(msg, textAlign: TextAlign.center),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () =>
                            context.read<HomeCubit>().getCoinsMarkets(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
              HomeSuccess(coins: var coins) => SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeTopBar(),
                    const SizedBox(height: 16),
                    const NavGrid(),
                    const SizedBox(height: 24),
                    const ActionCards(),
                    const SizedBox(height: 32),
                    CoinSection(
                      title: 'Recent Coin',
                      coins: coins.take(10).toList(),
                    ),
                    const SizedBox(height: 24),
                    if (coins.length > 10)
                      CoinSection(
                        title: 'Top Coins',
                        coins: coins.skip(10).toList(),
                      ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
