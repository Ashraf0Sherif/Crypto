import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({
    super.key,
    required this.value,
    required this.pair,
    required this.change,
    required this.icon,
    required this.isPositive,
  });

  final String value;
  final String pair;
  final String change;
  final String icon;
  final bool isPositive;

  List<FlSpot> _generateSpots() {
    final random = Random(isPositive ? 42 : 99);
    return List.generate(12, (i) {
      final baseY = isPositive
          ? 2 + (i / 11) * 4 + (random.nextDouble() - 0.5) * 1.5
          : 6 - (i / 11) * 4 + (random.nextDouble() - 0.5) * 1.5;
      return FlSpot(i.toDouble(), baseY.clamp(0.5, 7.5));
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
            value,
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
                  child: SvgPicture.asset(icon, width: 24, height: 24),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  pair,
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
            change,
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
