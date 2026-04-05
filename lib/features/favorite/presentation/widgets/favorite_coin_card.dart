import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../../../home/data/models/coin_model.dart';
import '../../logic/favorites_cubit.dart';

class FavoriteCoinCard extends StatelessWidget {
  final CoinModel coin;

  const FavoriteCoinCard({super.key, required this.coin});

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
    if (data.isEmpty) return [];

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

    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.coinDetails, arguments: coin.id);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.ghostBorder),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left column
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.surfaceContainer,
                        ),
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: coin.image,
                            width: 24,
                            height: 24,
                            placeholder: (context, url) => const SizedBox(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.currency_bitcoin,
                              size: 16,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              coin.name,
                              style: AppTextStyles.labelLg.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              coin.symbol.toUpperCase(),
                              style: AppTextStyles.labelMd.copyWith(
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    formattedPrice,
                    style: AppTextStyles.titleLg.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formattedChange,
                    style: AppTextStyles.labelMd.copyWith(
                      color: chartColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Right column
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: SvgPicture.asset(
                      Assets.svgs.starFilled.path,
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFB39DDB),
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () {
                      context.read<FavoritesCubit>().toggleFavorite(coin.id);
                    },
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
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
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
