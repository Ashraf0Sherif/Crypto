import 'package:hive_ce/hive.dart';

part 'coin_chart_model.g.dart';

@HiveType(typeId: 7)
class CoinChartModel {
  @HiveField(0)
  final List<ChartDataPoint> prices;

  CoinChartModel({required this.prices});

  factory CoinChartModel.fromJson(Map<String, dynamic> json) {
    final pricesRaw = json['prices'] as List;
    return CoinChartModel(
      prices: pricesRaw.map((e) => ChartDataPoint(
        timestamp: (e[0] as num).toDouble(),
        price: (e[1] as num).toDouble(),
      )).toList(),
    );
  }
}

@HiveType(typeId: 8)
class ChartDataPoint {
  @HiveField(0)
  final double timestamp;
  @HiveField(1)
  final double price;

  ChartDataPoint({required this.timestamp, required this.price});
}