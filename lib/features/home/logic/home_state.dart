import '../data/models/coin_model.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<CoinModel> coins;

  HomeSuccess(this.coins);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
