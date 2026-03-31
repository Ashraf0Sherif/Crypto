import 'package:flutter/material.dart';

import '../../data/models/nav_grid_item_data.dart';
import '../../../../gen/assets.gen.dart';
import 'nav_grid_item.dart';

class NavGrid extends StatelessWidget {
  const NavGrid({super.key});

  List<NavGridItemData> get _items => [
    NavGridItemData(icon: Assets.svgs.deposit.path, label: 'Deposit'),
    NavGridItemData(icon: Assets.svgs.referral.path, label: 'Referral'),
    NavGridItemData(icon: Assets.svgs.grid.path, label: 'Grid Trading'),
    NavGridItemData(icon: Assets.svgs.margin.path, label: 'Margin'),
    NavGridItemData(icon: Assets.svgs.launchpad.path, label: 'Launchpad'),
    NavGridItemData(icon: Assets.svgs.savings.path, label: 'Savings'),
    NavGridItemData(icon: Assets.svgs.liquid.path, label: 'Liquid Swap'),
    NavGridItemData(icon: Assets.svgs.more.path, label: 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 8,
          childAspectRatio: 0.85,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return NavGridItem(
            icon: item.icon,
            label: item.label,
            onTap: () {},
          );
        },
      ),
    );
  }
}
