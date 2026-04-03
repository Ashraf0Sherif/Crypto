import 'package:hive_ce/hive.dart';
import '../../../features/coin_details/data/models/coin_chart_model.dart';
import '../../../features/coin_details/data/models/coin_details_model.dart';
import '../../../features/home/data/models/coin_model.dart';

class HiveService {
  static const String _coinsBoxName = 'coins_box';
  static const String _marketsDataKey = 'markets_data';
  static const String _coinDetailsBoxName = 'coin_details_box';
  static const String _coinChartsBoxName = 'coin_charts_box';

  Future<void> saveCoins(List<CoinModel> coins) async {
    final box = await Hive.openBox<List>(_coinsBoxName);
    await box.put(_marketsDataKey, coins);
  }

  Future<List<CoinModel>?> getCachedCoins() async {
    final box = await Hive.openBox<List>(_coinsBoxName);
    final data = box.get(_marketsDataKey);
    
    if (data == null) return null;
    
    return data.cast<CoinModel>();
  }

  Future<void> clearCache() async {
    final box = await Hive.openBox<List>(_coinsBoxName);
    await box.clear();
  }

  Future<void> saveCoinDetails(CoinDetailsModel coin) async {
    var box = await Hive.openBox<CoinDetailsModel>(_coinDetailsBoxName);
    await box.put(coin.id, coin);
  }

  Future<CoinDetailsModel?> getCachedCoinDetails(String coinId) async {
    var box = await Hive.openBox<CoinDetailsModel>(_coinDetailsBoxName);
    return box.get(coinId);
  }

  Future<void> saveCoinChart(String coinId, int days, CoinChartModel chart) async {
    var box = await Hive.openBox<CoinChartModel>(_coinChartsBoxName);
    await box.put('${coinId}_$days', chart);
  }

  Future<CoinChartModel?> getCachedCoinChart(String coinId, int days) async {
    var box = await Hive.openBox<CoinChartModel>(_coinChartsBoxName);
    return box.get('${coinId}_$days');
  }
}
