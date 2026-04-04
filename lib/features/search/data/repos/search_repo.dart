import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../../../../core/local/hive/hive_service.dart';
import '../model/search_model.dart';

class SearchRepo {
  final ApiServices _apiServices;
  final HiveService _hiveService;

  SearchRepo(this._apiServices, this._hiveService);

  Future<Result<List<SearchCoinModel>>> searchCoins(String query) async {
    try {
      final response = await _apiServices.searchCoins(query);
      return Success(response);
    } catch (e) {
      return Failure('Search failed. Please try again.');
    }
  }

  // Local Storage Methods for History
  Future<void> saveSearchQuery(String query) async => await _hiveService.saveSearchQuery(query);
  Future<List<String>> getSearchHistory() async => await _hiveService.getSearchHistory();
  Future<void> clearSearchHistory() async => await _hiveService.clearSearchHistory();
  Future<void> removeSearchQuery(String query) async => await _hiveService.removeSearchQuery(query);
}