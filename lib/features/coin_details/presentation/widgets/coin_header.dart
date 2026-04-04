import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/coin_details_model.dart';

class CoinHeader extends StatelessWidget {
  final CoinDetailsModel details;
  final bool isOffline;

  const CoinHeader({
    super.key,
    required this.details,
    this.isOffline = false,
  });

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    final priceChange = details.marketData.priceChangePercentage24h ?? 0.0;
    final isPositive = priceChange >= 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.network(details.image.large, width: 48, height: 48),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(details.name, style: AppTextStyles.headlineLg),
                      const SizedBox(width: 8),
                      if (isOffline)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceVariant,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppColors.onSurfaceMuted.withValues(alpha: 0.5)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.cloud_off, size: 12, color: AppColors.onSurfaceMuted),
                              const SizedBox(width: 4),
                              Text(
                                'CACHED',
                                style: AppTextStyles.labelSm.copyWith(
                                  color: AppColors.onSurfaceMuted,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Text(details.symbol.toUpperCase(), style: AppTextStyles.labelLg),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 24),
        Text(
          formatCurrency.format(details.marketData.currentPriceUsd),
          style: AppTextStyles.displayMd,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              isPositive ? Icons.trending_up : Icons.trending_down,
              color: isPositive ? AppColors.tertiary : AppColors.error,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              '${isPositive ? '+' : ''}${priceChange.toStringAsFixed(2)}% (24h)',
              style: AppTextStyles.titleSm.copyWith(
                color: isPositive ? AppColors.tertiary : AppColors.error,
              ),
            ),
          ],
        )
      ],
    );
  }
}