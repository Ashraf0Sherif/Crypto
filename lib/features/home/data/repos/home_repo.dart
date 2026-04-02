import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/coin_model.dart';

class HomeRepo {
  final ApiServices _apiServices;

  HomeRepo(this._apiServices);

  Future<Result<List<CoinModel>>> getCoinsMarkets({
    String vsCurrency = 'usd',
    int perPage = 20,
    int page = 1,
    bool sparkline = true,
  }) async {
    try {
      final data = await _apiServices.getCoinsMarkets(
        vsCurrency: vsCurrency,
        perPage: perPage,
        page: page,
        sparkline: sparkline,
      );
      return Success(data);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
