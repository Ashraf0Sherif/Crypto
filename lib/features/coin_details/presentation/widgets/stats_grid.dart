import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/coin_details_model.dart';
import 'stats_card.dart';

class StatsGrid extends StatelessWidget {
  final MarketDataModel marketData;

  const StatsGrid({super.key, required this.marketData});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 0,
    );
    double progress = 0.5;
    final low = marketData.low24hUsd;
    final high = marketData.high24hUsd;
    final current = marketData.currentPriceUsd;
    if (high != low) {
      progress = ((current - low) / (high - low)).clamp(0.0, 1.0);
    }
    return Column(
      children: [
        StatCard(
          title: 'MARKET CAP',
          value: formatCurrency.format(marketData.marketCapUsd),
        ),
        const SizedBox(height: 16),
        StatCard(
          title: 'VOLUME (24H)',
          value: formatCurrency.format(marketData.totalVolumeUsd),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('24H HIGH / LOW', style: AppTextStyles.labelMd),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${low.toStringAsFixed(2)}',
                    style: AppTextStyles.titleSm,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: AppColors.surfaceContainerHighest,
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(4),
                        minHeight: 4,
                      ),
                    ),
                  ),
                  Text(
                    '\$${high.toStringAsFixed(2)}',
                    style: AppTextStyles.titleSm,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        StatCard(
          title: 'ALL TIME HIGH',
          value: formatCurrency.format(marketData.athUsd),
        ),
        const SizedBox(height: 16),
        StatCard(
          title: 'CIRCULATING SUPPLY',
          value: NumberFormat.compact().format(
            marketData.circulatingSupply ?? 0,
          ),
        ),
      ],
    );
  }
}
