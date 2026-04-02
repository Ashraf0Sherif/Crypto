import 'package:hive_ce/hive.dart';
import '../../../features/home/data/models/coin_model.dart';

class HiveService {
  static const String _coinsBoxName = 'coins_box';
  static const String _marketsDataKey = 'markets_data';

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
}
