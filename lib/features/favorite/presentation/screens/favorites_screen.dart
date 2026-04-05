import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/lottie_loader.dart';
import '../../../../gen/assets.gen.dart';
import '../../logic/favorites_cubit.dart';
import '../../logic/favorites_state.dart';
import '../widgets/favorite_coin_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: AppTextStyles.titleMd.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading || state is FavoritesInitial) {
            return const Center(child: LottieLoader());
          }

          if (state is FavoritesError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(state.message, style: AppTextStyles.bodyLg),
                  TextButton(
                    onPressed: () =>
                        context.read<FavoritesCubit>().loadFavorites(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is FavoritesLoaded) {
            if (state.favoriteCoins.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.svgs.star.path,
                      width: 48,
                      colorFilter: ColorFilter.mode(
                        AppColors.onSurfaceVariant,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No favorites yet',
                      style: AppTextStyles.titleLg.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tap the star icon on any coin to add it here.',
                      style: AppTextStyles.bodyMd.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 64),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () => context.read<FavoritesCubit>().loadFavorites(),
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 16,
                  bottom: 100,
                ),
                itemCount: state.favoriteCoins.length,
                itemBuilder: (context, index) {
                  return FavoriteCoinCard(coin: state.favoriteCoins[index]);
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
