import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../gen/assets.gen.dart';
import 'top_bar_icon_button.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
            ),
            child: const Center(
              child: Icon(Icons.person, color: AppColors.onPrimary, size: 22),
            ),
          ),
          const Spacer(),
          TopBarIconButton(image: Assets.svgs.search.path, onTap: () {}),
          const SizedBox(width: 8),
          TopBarIconButton(image: Assets.svgs.scan.path, onTap: () {}),
          const SizedBox(width: 8),
          TopBarIconButton(image: Assets.svgs.notif.path, onTap: () {}),
          const SizedBox(width: 8),
          TopBarIconButton(
            image: Assets.svgs.more.path,
            onTap: () => context.pushNamed(Routes.settings),
          ),
        ],
      ),
    );
  }
}
