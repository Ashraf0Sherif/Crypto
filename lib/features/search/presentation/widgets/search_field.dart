import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../logic/search_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return TextField(
      controller: cubit.searchController,
      style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurface),
      onSubmitted: (value) {
        final query = value.trim();
        if (query.isNotEmpty) {
          cubit.addToHistory(query);
          cubit.search(query);
        }
      },
      decoration: InputDecoration(
        hintText: 'Search for a coin...',
        hintStyle: AppTextStyles.bodyMd.copyWith(
          color: AppColors.onSurfaceMuted,
        ),
        prefixIcon: const Icon(Icons.search, color: AppColors.onSurfaceMuted),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.arrow_forward_rounded,
            color: AppColors.primary,
          ),
          onPressed: () {
            final query = cubit.searchController.text.trim();
            if (query.isNotEmpty) {
              cubit.addToHistory(query);
              cubit.search(query);
            }
          },
        ),
        filled: true,
        fillColor: AppColors.surfaceContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

