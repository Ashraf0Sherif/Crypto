import 'package:crypto_app/features/coin_details/presentation/widgets/stats_grid.dart';
import 'package:crypto_app/features/coin_details/presentation/widgets/timeframe_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/lottie_loader.dart';
import '../../logic/coin_details_cubit.dart';
import '../../logic/coin_details_state.dart';
import '../widgets/about_section.dart';
import '../widgets/coin_chart.dart';
import '../widgets/coin_header.dart';

class CoinDetailsScreen extends StatelessWidget {
  final String coinId;
  const CoinDetailsScreen({super.key, required this.coinId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Coin Details', style: AppTextStyles.titleMd),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.onSurface),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.star_border,
              color: AppColors.secondaryFixedDim,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<CoinDetailsCubit, CoinDetailsState>(
          builder: (context, state) {
            return switch (state) {
              CoinDetailsLoading() => const Center(child: LottieLoader()),
              CoinDetailsError(message: var msg) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: AppColors.error,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(msg, style: AppTextStyles.bodyLg),
                    TextButton(
                      onPressed: () => context
                          .read<CoinDetailsCubit>()
                          .getCoinData(coinId: coinId),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              CoinDetailsSuccess(
                coinDetails: var details,
                coinChart: var chart,
                selectedChartDays: var days,
                isUpdatingChart: var isChartLoading,
                isOffline: var isOfflineData,
                chartErrorMessage: var chartError,
              ) =>
                SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CoinHeader(details: details, isOffline: isOfflineData),
                      const SizedBox(height: 32),
                      CoinChart(
                        prices: chart.prices,
                        priceChange:
                            details.marketData.priceChangePercentage24h ?? 0,
                        isLoading: isChartLoading,
                        errorMessage: chartError,
                      ),
                      const SizedBox(height: 24),
                      TimeframeFilters(selectedDays: days),
                      const SizedBox(height: 32),
                      StatsGrid(marketData: details.marketData),
                      const SizedBox(height: 32),
                      AboutSection(details: details),
                      const SizedBox(height: 40),
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
