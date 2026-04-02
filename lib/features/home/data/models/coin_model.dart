import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CoinModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String symbol;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String image;

  @JsonKey(name: 'current_price')
  @HiveField(4)
  final double currentPrice;

  @JsonKey(name: 'price_change_percentage_24h')
  @HiveField(5)
  final double priceChangePercentage24h;

  @JsonKey(name: 'sparkline_in_7d')
  @HiveField(6)
  final SparklineData sparklineIn7d;

  CoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangePercentage24h,
    required this.sparklineIn7d,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoinModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 1)
class SparklineData {
  @HiveField(0)
  final List<double> price;

  SparklineData({required this.price});

  factory SparklineData.fromJson(Map<String, dynamic> json) =>
      _$SparklineDataFromJson(json);
  Map<String, dynamic> toJson() => _$SparklineDataToJson(this);
}