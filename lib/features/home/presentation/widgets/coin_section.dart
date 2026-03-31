import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/coin_data.dart';
import 'coin_card.dart';

class CoinSection extends StatelessWidget {
  const CoinSection({super.key, required this.title, required this.coins});

  final String title;
  final List<CoinData> coins;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTextStyles.headlineSm),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: AppTextStyles.labelMd.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: coins.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final coin = coins[index];
              return CoinCard(
                value: coin.value,
                pair: coin.pair,
                change: coin.change,
                icon: coin.icon,
                isPositive: coin.isPositive,
              );
            },
          ),
        ),
      ],
    );
  }
}
