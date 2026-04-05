import '../../home/data/models/coin_model.dart';

sealed class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<CoinModel> favoriteCoins;
  final List<String> favoriteIds;

  FavoritesLoaded(this.favoriteCoins, this.favoriteIds);
}

class FavoritesError extends FavoritesState {
  final String message;

  FavoritesError(this.message);
}
