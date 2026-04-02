import 'package:json_annotation/json_annotation.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class CoinModel {
  final String id;
  final String symbol;
  final String name;
  final String image;

  @JsonKey(name: 'current_price')
  final double currentPrice;

  @JsonKey(name: 'price_change_percentage_24h')
  final double priceChangePercentage24h;

  @JsonKey(name: 'sparkline_in_7d')
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

  factory CoinModel.fromJson(Map<String, dynamic> json) => _$CoinModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoinModelToJson(this);
}

@JsonSerializable()
class SparklineData {
  final List<double> price;

  SparklineData({required this.price});

  factory SparklineData.fromJson(Map<String, dynamic> json) => _$SparklineDataFromJson(json);
  Map<String, dynamic> toJson() => _$SparklineDataToJson(this);
}