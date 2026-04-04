import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../logic/coin_details_cubit.dart';

class TimeframeFilters extends StatelessWidget {
  final int selectedDays;

  const TimeframeFilters({super.key, required this.selectedDays});

  @override
  Widget build(BuildContext context) {
    final filters = {1: '1D', 7: '1W', 30: '1M', 365: '1Y'};

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: filters.entries.map((entry) {
        final isSelected = selectedDays == entry.key;
        return GestureDetector(
          onTap: () =>
              context.read<CoinDetailsCubit>().updateChartTimeframe(entry.key),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryContainer
                  : AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              entry.value,
              style: AppTextStyles.labelLg.copyWith(
                color: isSelected ? AppColors.white : AppColors.onSurfaceMuted,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}