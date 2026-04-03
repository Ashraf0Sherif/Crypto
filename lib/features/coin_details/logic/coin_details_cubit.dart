import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/api_result.dart';
import '../data/models/coin_chart_model.dart';
import '../data/models/coin_details_model.dart';
import '../data/repos/coin_details_repo.dart';
import 'coin_details_state.dart';

class CoinDetailsCubit extends Cubit<CoinDetailsState> {
  final CoinDetailsRepo _repo;
  CoinDetailsModel? _cachedDetails;
  String? _currentCoinId;

  bool _isDetailsOffline = false; 

  CoinDetailsCubit(this._repo) : super(CoinDetailsInitial());

  Future<void> getCoinData({required String coinId, int days = 1}) async {
    _currentCoinId = coinId;

    if (_cachedDetails == null || _currentCoinId != coinId) {
      emit(CoinDetailsLoading());

      final results = await Future.wait([
        _repo.getCoinDetails(coinId),
        _repo.getCoinChart(coinId, days: days),
      ]);

      final detailsResult = results[0] as Result<CoinDetailsModel>;
      final chartResult = results[1] as Result<CoinChartModel>;

      if (detailsResult is Success<CoinDetailsModel> && chartResult is Success<CoinChartModel>) {
        _cachedDetails = detailsResult.data;
        
        _isDetailsOffline = detailsResult.isOffline; 
        
        final isOffline = _isDetailsOffline || chartResult.isOffline;

        emit(CoinDetailsSuccess(
          coinDetails: _cachedDetails!,
          coinChart: chartResult.data,
          selectedChartDays: days,
          isOffline: isOffline,
        ));
      } else {
        emit(CoinDetailsError('Unable to load coin data.'));
      }
    } 
    else {
      if (state is CoinDetailsSuccess) {
        final currentState = state as CoinDetailsSuccess;
        emit(CoinDetailsSuccess(
          coinDetails: currentState.coinDetails,
          coinChart: currentState.coinChart,
          selectedChartDays: days,
          isUpdatingChart: true,
          isOffline: currentState.isOffline, 
        ));
      }

      final chartResult = await _repo.getCoinChart(coinId, days: days);


      switch (chartResult) {
        case Success(data: var chartData, isOffline: var isChartOffline):
          emit(CoinDetailsSuccess(
            coinDetails: _cachedDetails!,
            coinChart: chartData,
            selectedChartDays: days,
            isUpdatingChart: false,
            isOffline: _isDetailsOffline || isChartOffline,
            chartErrorMessage: null, 
          ));
        case Failure(error: var msg):
          if (state is CoinDetailsSuccess) {
            final currentState = state as CoinDetailsSuccess;
            emit(CoinDetailsSuccess(
              coinDetails: currentState.coinDetails,
              coinChart: currentState.coinChart, 
              selectedChartDays: days,
              isUpdatingChart: false, 
              isOffline: currentState.isOffline,
              chartErrorMessage: msg, 
            ));
          }
      }
    }
  }

  void updateChartTimeframe(int days) {
    if (_currentCoinId != null) {
      getCoinData(coinId: _currentCoinId!, days: days);
    }
  }
}