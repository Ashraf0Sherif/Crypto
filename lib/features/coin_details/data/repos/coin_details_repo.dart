import '../../../../core/local/hive/hive_service.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../../../../core/networking/api_error.dart';
import 'package:dio/dio.dart';
import '../models/coin_chart_model.dart';
import '../models/coin_details_model.dart';

class CoinDetailsRepo {
  final ApiServices _apiServices;
  final HiveService _hiveService; 

  CoinDetailsRepo(this._apiServices, this._hiveService);

  Future<Result<CoinDetailsModel>> getCoinDetails(String coinId) async {
    try {
      final data = await _apiServices.getCoinDetails(coinId: coinId);
      await _hiveService.saveCoinDetails(data); 
      return Success(data);
    } catch (e) {
      final cachedData = await _hiveService.getCachedCoinDetails(coinId);
      if (cachedData != null) {
        return Success(cachedData, isOffline: true); 
      }
      if (e is DioException) {
        return Failure(ServerFailure.fromDioError(e).errMessages);
      }
      return Failure('Something went wrong. Please try again.');
    }
  }

  Future<Result<CoinChartModel>> getCoinChart(
    String coinId, {
    int days = 1,
    String vsCurrency = 'usd',
  }) async {
    try {
      final data = await _apiServices.getCoinChart(
        coinId: coinId,
        days: days,
        vsCurrency: vsCurrency,
      );
      await _hiveService.saveCoinChart(coinId, days, data); 
      return Success(data);
    } catch (e) {
      final cachedData = await _hiveService.getCachedCoinChart(coinId, days);
      if (cachedData != null) {
        return Success(cachedData, isOffline: true); 
      }
      if (e is DioException) {
        return Failure(ServerFailure.fromDioError(e).errMessages);
      }
      return Failure('Something went wrong. Please try again.');
    }
  }
}