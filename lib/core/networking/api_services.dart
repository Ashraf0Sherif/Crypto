import 'package:dio/dio.dart';

import '../../features/coin_details/data/models/coin_chart_model.dart';
import '../../features/coin_details/data/models/coin_details_model.dart';
import '../../features/home/data/models/coin_model.dart';
import '../../features/search/data/model/search_model.dart';
import '../../features/trending/data/model/trending_model.dart';
import 'api_constants.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio);

  Future<List<CoinModel>> getCoinsMarkets({
    String vsCurrency = 'usd',
    int perPage = 20,
    int page = 1,
    bool sparkline = true,
  }) async {
    final response = await _dio.get(
      ApiConstants.coinsMarkets,
      queryParameters: {
        'vs_currency': vsCurrency,
        'per_page': perPage,
        'page': page,
        'sparkline': sparkline,
      },
    );

    return (response.data as List)
        .map((json) => CoinModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<CoinDetailsModel> getCoinDetails({required String coinId}) async {
    final response = await _dio.get(
      'coins/$coinId',
      queryParameters: {
        'localization': false,
        'tickers': false,
        'community_data': false,
        'developer_data': false,
        'sparkline': false,
      },
    );

    return CoinDetailsModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<CoinChartModel> getCoinChart({
    required String coinId,
    int days = 1,
    String vsCurrency = 'usd',
  }) async {
    final response = await _dio.get(
      'coins/$coinId/market_chart',
      queryParameters: {'vs_currency': vsCurrency, 'days': days},
    );

    return CoinChartModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<List<SearchCoinModel>> searchCoins(String query) async {
    final response = await _dio.get(
      'search',
      queryParameters: {'query': query},
    );
    return (response.data['coins'] as List)
        .map((json) => SearchCoinModel.fromJson(json))
        .toList();
  }

  Future<List<TrendingCoinModel>> getTrendingCoins() async {
    final response = await _dio.get('search/trending');
    return (response.data['coins'] as List)
        .map((json) => TrendingCoinModel.fromJson(json['item']))
        .toList();
  }
}
