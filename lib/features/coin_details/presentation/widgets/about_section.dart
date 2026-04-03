import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/coin_details_model.dart';

class AboutSection extends StatelessWidget {
  final CoinDetailsModel details;

  const AboutSection({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    if (details.descriptionEn.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About ${details.name}', style: AppTextStyles.headlineSm),
        const SizedBox(height: 16),
        Text(
          details.descriptionEn.replaceAll(RegExp(r'<[^>]*>'), ''),
          style: AppTextStyles.bodyLg,
        ),
      ],
    );
  }
}