import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/lottie_loader.dart';
import '../../logic/trending_cubit.dart';
import '../../logic/trending_state.dart';
import '../widgets/trending_coin_card.dart';
import '../widgets/trending_header.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.trending_up, color: AppColors.primary),
            const SizedBox(width: 8),
            Text('Trending', style: AppTextStyles.headlineMd),
          ],
        ),
      ),
      body: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingLoading || state is TrendingInitial) {
            return const Center(child: LottieLoader());
          } else if (state is TrendingError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(state.message, style: AppTextStyles.bodyLg),
                  TextButton(
                    onPressed: () =>
                        context.read<TrendingCubit>().getTrendingCoins(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (state is TrendingSuccess) {
            return RefreshIndicator(
              color: AppColors.primary,
              backgroundColor: AppColors.surfaceContainer,
              onRefresh: () async =>
                  context.read<TrendingCubit>().getTrendingCoins(),
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
                itemCount: state.trendingCoins.length + 1,
                separatorBuilder: (_, _) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  if (index == 0) return const TrendingHeader();

                  final coin = state.trendingCoins[index - 1];
                  return TrendingCoinCard(coin: coin, isHotAsset: index == 1);
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}