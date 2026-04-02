import '../../../../core/local/hive/hive_service.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/coin_model.dart';

class HomeRepo {
  final ApiServices _apiServices;
  final HiveService _hiveService;

  HomeRepo(this._apiServices, this._hiveService);

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
      await _hiveService.saveCoins(data);
      return Success(data);
    } catch (e) {
      final cachedData = await _hiveService.getCachedCoins();
      if (cachedData != null && cachedData.isNotEmpty) {
        return Success(cachedData);
      }
      return Failure('Unable to fetch data. Please check your connection.');
    }
  }
}
