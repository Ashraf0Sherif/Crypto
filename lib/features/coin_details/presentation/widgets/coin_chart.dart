import 'package:crypto_app/features/coin_details/data/models/coin_chart_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CoinChart extends StatelessWidget {
  final List<ChartDataPoint> prices;
  final double priceChange;
  final bool isLoading;
  final String? errorMessage;
  const CoinChart({
    super.key,
    required this.prices,
    required this.priceChange,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final spots = prices.map((e) => FlSpot(e.timestamp, e.price)).toList();
    final isPositive = priceChange >= 0;
    final lineColor = isPositive ? AppColors.tertiary : AppColors.error;

    Widget content;
    
    if (errorMessage != null) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, color: AppColors.onSurfaceMuted, size: 28),
            const SizedBox(height: 8),
            Text(
              errorMessage!,
              textAlign: TextAlign.center,
              style: AppTextStyles.labelMd.copyWith(color: AppColors.onSurfaceMuted),
            ),
          ],
        ),
      );
    } else if (isLoading) {
      content = const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    } else {
      content = LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: lineColor,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    lineColor.withValues(alpha: 0.3),
                    lineColor.withValues(alpha: 0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: content,
    );
  }
}