import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../../search/presentation/screens/search_screen.dart';

enum NavItemType {
  home,
  search,
  trades,
  activity,
  wallets;

  String get label {
    switch (this) {
      case NavItemType.home:
        return 'Home';
      case NavItemType.search:
        return 'Search';
      case NavItemType.trades:
        return 'Trades';
      case NavItemType.activity:
        return 'Activity';
      case NavItemType.wallets:
        return 'Wallets';
    }
  }

  String get iconPath {
    switch (this) {
      case NavItemType.home:
        return Assets.svgs.home.path;
      case NavItemType.search:
        return Assets.svgs.search.path;
      case NavItemType.trades:
        return Assets.svgs.trades.path;
      case NavItemType.activity:
        return Assets.svgs.activity.path;
      case NavItemType.wallets:
        return Assets.svgs.wallet.path;
    }
  }

  Widget get screen {
    switch (this) {
      case NavItemType.home:
        return const HomeScreen();
      case NavItemType.search:
        return const SearchScreen();
      case NavItemType.trades:
        return const Center(
          child: Text('Trades', style: TextStyle(color: AppColors.white)),
        );
      case NavItemType.activity:
        return const Center(
          child: Text('Activity', style: TextStyle(color: AppColors.white)),
        );
      case NavItemType.wallets:
        return const Center(
          child: Text('Wallets', style: TextStyle(color: AppColors.white)),
        );
    }
  }
}

class BottomNavCubit extends Cubit<NavItemType> {
  BottomNavCubit() : super(NavItemType.home);
  void updateTab(NavItemType type) {
    emit(type);
  }
}
