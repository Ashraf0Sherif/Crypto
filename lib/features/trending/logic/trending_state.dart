
import '../data/model/trending_model.dart';

sealed class TrendingState {}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingSuccess extends TrendingState {
  final List<TrendingCoinModel> trendingCoins;
  TrendingSuccess(this.trendingCoins);
}

class TrendingError extends TrendingState {
  final String message;
  TrendingError(this.message);
}