import '../../../../core/local/hive/hive_service.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../../../../core/networking/api_error.dart';
import 'package:dio/dio.dart';
import '../../../home/data/models/coin_model.dart';

class FavoritesRepo {
  final ApiServices _apiServices;
  final HiveService _hiveService;

  FavoritesRepo(this._apiServices, this._hiveService);

  Future<Result<List<CoinModel>>> getFavoriteCoins() async {
    List<String> favoriteIds = [];
    try {
      favoriteIds = await _hiveService.getFavoriteIds();
      
      if (favoriteIds.isEmpty) {
        return Success([], isOffline: false);
      }
      final idsString = favoriteIds.join(',');
      final response = await _apiServices.getCoinsMarkets(ids: idsString);
      return Success(response, isOffline: false);
    } catch (e) {
      if (favoriteIds.isNotEmpty) {
        final cachedData = await _hiveService.getCachedCoins();
        if (cachedData != null) {
          final favoriteCoins = cachedData.where((coin) => favoriteIds.contains(coin.id)).toList();
          if (favoriteCoins.isNotEmpty) {
            return Success(favoriteCoins, isOffline: true);
          }
        }
      }
      
      if (e is DioException) {
        return Failure(ServerFailure.fromDioError(e).errMessages);
      }
      return Failure('Something went wrong. Please try again.');
    }
  }

  Future<void> toggleFavorite(String coinId) async {
    await _hiveService.toggleFavorite(coinId);
  }

  Future<List<String>> getFavoriteIds() async {
    return _hiveService.getFavoriteIds();
  }
}
