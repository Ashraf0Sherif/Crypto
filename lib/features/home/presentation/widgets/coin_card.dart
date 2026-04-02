import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/coin_model.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({super.key, required this.coin});

  final CoinModel coin;

  bool get isPositive => coin.priceChangePercentage24h >= 0;

  String get formattedPrice {
    if (coin.currentPrice >= 1000) {
      return '\$${coin.currentPrice.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+\.)'), (m) => '${m[1]},')}';
    }
    return '\$${coin.currentPrice.toStringAsFixed(2)}';
  }

  String get formattedChange {
    final sign = isPositive ? '+' : '';
    return '$sign${coin.priceChangePercentage24h.toStringAsFixed(2)}%';
  }

  List<FlSpot> _generateSpots() {
    final prices = coin.sparklineIn7d.price;
    if (prices.isEmpty) return [];
    final data = prices.length > 24
        ? prices.sublist(prices.length - 24)
        : prices;
    final minPrice = data.reduce((a, b) => a < b ? a : b);
    final maxPrice = data.reduce((a, b) => a > b ? a : b);
    final range = maxPrice - minPrice;

    return List.generate(data.length, (i) {
      final normalized = range == 0
          ? 4.0
          : ((data[i] - minPrice) / range) * 7 + 0.5;
      return FlSpot(i.toDouble(), normalized);
    });
  }

  @override
  Widget build(BuildContext context) {
    final chartColor = isPositive ? AppColors.tertiary : AppColors.error;

    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.ghostBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            formattedPrice,
            style: AppTextStyles.titleMd.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surfaceContainer,
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: coin.image,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const SizedBox(
                      width: 24,
                      height: 24,
                      child: SizedBox.shrink(),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.currency_bitcoin,
                      size: 16,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${coin.symbol.toUpperCase()}/USD',
                  style: AppTextStyles.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            formattedChange,
            style: AppTextStyles.labelSm.copyWith(
              color: chartColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 32,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineTouchData: const LineTouchData(enabled: false),
                minY: 0,
                maxY: 8,
                lineBarsData: [
                  LineChartBarData(
                    spots: _generateSpots(),
                    isCurved: true,
                    curveSmoothness: 0.3,
                    color: chartColor,
                    barWidth: 1.5,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          chartColor.withValues(alpha: 0.2),
                          chartColor.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
