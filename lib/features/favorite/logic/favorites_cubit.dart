import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/api_result.dart';
import '../data/repos/favorites_repo.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo _repo;
  List<String> _currentFavoriteIds = [];

  FavoritesCubit(this._repo) : super(FavoritesInitial());

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    
    _currentFavoriteIds = await _repo.getFavoriteIds();

    final result = await _repo.getFavoriteCoins();

    switch (result) {
      case Success(data: var coins):
        emit(FavoritesLoaded(coins, _currentFavoriteIds));
      case Failure(error: var msg):
        emit(FavoritesError(msg));
    }
  }

  Future<void> toggleFavorite(String coinId) async {
    await _repo.toggleFavorite(coinId);
    
    if (_currentFavoriteIds.contains(coinId)) {
      _currentFavoriteIds.remove(coinId);
    } else {
      _currentFavoriteIds.add(coinId);
    }

    if (_currentFavoriteIds.isEmpty) {
      emit(FavoritesLoaded([], []));
    } else {
      await loadFavorites();
    }
  }

  bool isFavorite(String coinId) {
    if (state is FavoritesLoaded) {
      return (state as FavoritesLoaded).favoriteIds.contains(coinId);
    }
    return _currentFavoriteIds.contains(coinId);
  }
}
