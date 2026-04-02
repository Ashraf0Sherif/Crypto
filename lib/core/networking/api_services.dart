import 'package:dio/dio.dart';

import '../../features/home/data/models/coin_model.dart';
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
}
