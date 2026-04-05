import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../gen/assets.gen.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../../search/presentation/screens/search_screen.dart';
import '../../trending/presentation/screens/trending_screen.dart';
import '../../favorite/presentation/screens/favorites_screen.dart';

enum NavItemType {
  home,
  search,
  trending,
  favorites;

  String get label {
    switch (this) {
      case NavItemType.home:
        return 'Home';
      case NavItemType.search:
        return 'Search';
      case NavItemType.trending:
        return 'Trending';
      case NavItemType.favorites:
        return 'Favorites';
    }
  }

  String get iconPath {
    switch (this) {
      case NavItemType.home:
        return Assets.svgs.home.path;
      case NavItemType.search:
        return Assets.svgs.search.path;
      case NavItemType.trending:
        return Assets.svgs.trades.path;
      case NavItemType.favorites:
        return Assets.svgs.star.path;
    }
  }

  Widget get screen {
    switch (this) {
      case NavItemType.home:
        return const HomeScreen();
      case NavItemType.search:
        return const SearchScreen();
      case NavItemType.trending:
        return const TrendingScreen();
      case NavItemType.favorites:
        return const FavoritesScreen();
    }
  }
}

class BottomNavCubit extends Cubit<NavItemType> {
  BottomNavCubit() : super(NavItemType.home);
  void updateTab(NavItemType type) {
    emit(type);
  }
}
