import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/formatting_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/model/trending_model.dart';

class TrendingCoinCard extends StatelessWidget {
  final TrendingCoinModel coin;
  final bool isHotAsset;

  const TrendingCoinCard({
    super.key,
    required this.coin,
    this.isHotAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    final priceChange = coin.data.priceChangeUsd;
    final isPositive = priceChange >= 0;
    final trendColor = isPositive ? AppColors.tertiary : AppColors.error;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.ghostBorder),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [
                        Text(
                          '#${coin.marketCapRank ?? '-'}',
                          style: AppTextStyles.labelMd.copyWith(color: AppColors.onSurfaceMuted),
                        ),
                        const SizedBox(width: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            imageUrl: coin.thumb,
                            width: 36,
                            height: 36,
                            placeholder: (context, url) => const Icon(
                              Icons.monetization_on,
                              color: AppColors.primary,
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              color: AppColors.error,
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
                                style: AppTextStyles.titleLg,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                coin.symbol.toUpperCase(),
                                style: AppTextStyles.labelMd.copyWith(color: AppColors.onSurfaceMuted),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Expanded(
                    flex: 3,
                    child: coin.data.sparkline != null
                        ? SizedBox(
                            height: 40,
                            child: SvgPicture.network(
                              coin.data.sparkline!,
                              fit: BoxFit.contain,
                              colorFilter: ColorFilter.mode(trendColor, BlendMode.srcIn),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          coin.data.price.toPriceFormat(),
                          style: AppTextStyles.titleLg.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isPositive ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                              color: trendColor,
                              size: 18,
                            ),
                            Text(
                              '${isPositive ? '+' : ''}${priceChange.toStringAsFixed(1)}%',
                              style: AppTextStyles.labelMd.copyWith(
                                color: trendColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      _buildBottomStat('VOL 24H', coin.data.totalVolume.toBigNumberFormat()),
                      const SizedBox(width: 24),
                      _buildBottomStat('MCAP', coin.data.marketCap.toBigNumberFormat()),
                    ],
                  ),
                  if (coin.data.content?.description != null && coin.data.content!.description!.isNotEmpty)
                    Icon(Icons.info, color: AppColors.onSurfaceMuted.withValues(alpha: .5), size: 20),
                ],
              ),
            ],
          ),
        ),
        
        if (isHotAsset)
          Positioned(
            top: 0,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.tertiary,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
              ),
              child: Text(
                'HOT ASSET',
                style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.onTertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelSm.copyWith(
            color: AppColors.onSurfaceMuted.withValues(alpha: .7),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.labelMd.copyWith(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }
}

