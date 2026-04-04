import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/model/search_model.dart';
import '../../logic/search_cubit.dart';
import 'search_result_card.dart';

class SearchResults extends StatelessWidget {
  final List<SearchCoinModel> coins;

  const SearchResults({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Search Result', style: AppTextStyles.titleMd),
            TextButton(
              onPressed: () {
                cubit.searchController.clear();
                cubit.search('');
              },
              child: Text(
                'CLEAR',
                style: AppTextStyles.labelMd.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: coins.length,
          separatorBuilder: (_, _) => const SizedBox(height: 16),
          itemBuilder: (context, index) =>
              SearchResultCard(coin: coins[index]),
        ),
      ],
    );
  }
}