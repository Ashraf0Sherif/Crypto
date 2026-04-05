import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../model/trending_model.dart';

class TrendingRepo {
  final ApiServices _apiServices;

  TrendingRepo(this._apiServices);

  Future<Result<List<TrendingCoinModel>>> getTrendingCoins() async {
    try {
      final response = await _apiServices.getTrendingCoins();
      return Success(response);
    } catch (e) {
      return Failure('Failed to load trending coins. Please try again.');
    }
  }
}