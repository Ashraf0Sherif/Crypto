import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../../../../core/networking/api_error.dart';
import 'package:dio/dio.dart';
import '../model/trending_model.dart';

class TrendingRepo {
  final ApiServices _apiServices;

  TrendingRepo(this._apiServices);

  Future<Result<List<TrendingCoinModel>>> getTrendingCoins() async {
    try {
      final response = await _apiServices.getTrendingCoins();
      return Success(response);
    } catch (e) {
      if (e is DioException) {
        return Failure(ServerFailure.fromDioError(e).errMessages);
      }
      return Failure('Something went wrong. Please try again.');
    }
  }
}