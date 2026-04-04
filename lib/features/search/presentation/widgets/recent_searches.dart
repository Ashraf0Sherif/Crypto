import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../logic/search_cubit.dart';

class RecentSearches extends StatelessWidget {
  final List<String> history;

  const RecentSearches({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) return const SizedBox.shrink();
    final cubit = context.read<SearchCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Searches', style: AppTextStyles.titleMd),
            TextButton(
              onPressed: () => cubit.clearHistory(),
              child: Text(
                'CLEAR ALL',
                style: AppTextStyles.labelMd.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: history
              .map(
                (query) => InputChip(
                  label: Text(query, style: AppTextStyles.labelMd),
                  backgroundColor: AppColors.surfaceContainerHigh,
                  deleteIcon: const Icon(Icons.close, size: 14),
                  onDeleted: () => cubit.removeQuery(query),
                  onPressed: () {
                    cubit.searchController.text = query;
                    cubit.search(query);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  side: BorderSide.none,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

