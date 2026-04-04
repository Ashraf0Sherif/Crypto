
import '../data/models/coin_chart_model.dart';
import '../data/models/coin_details_model.dart';

sealed class CoinDetailsState {}

class CoinDetailsInitial extends CoinDetailsState {}

class CoinDetailsLoading extends CoinDetailsState {}

class CoinDetailsSuccess extends CoinDetailsState {
  final CoinDetailsModel coinDetails;
  final CoinChartModel coinChart;
  final int selectedChartDays;
  final bool isUpdatingChart;
  final bool isOffline;
  final String? chartErrorMessage;

  CoinDetailsSuccess({
    required this.coinDetails,
    required this.coinChart,
    required this.selectedChartDays,
    this.isUpdatingChart = false,
    this.isOffline = false,
    this.chartErrorMessage,
  });
}
class CoinDetailsError extends CoinDetailsState {
  final String message;

  CoinDetailsError(this.message);
}