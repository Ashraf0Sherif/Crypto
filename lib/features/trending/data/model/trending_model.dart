import 'package:json_annotation/json_annotation.dart';

part 'trending_model.g.dart';

@JsonSerializable()
class TrendingCoinModel {
  final String id;
  final String name;
  final String symbol;

  @JsonKey(name: 'market_cap_rank')
  final int? marketCapRank;

  final String thumb;
  final String large;

  final TrendingCoinDataModel data;

  TrendingCoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    this.marketCapRank,
    required this.thumb,
    required this.large,
    required this.data,
  });

  factory TrendingCoinModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingCoinModelFromJson(json);
}

@JsonSerializable()
class TrendingCoinDataModel {
  final double? price;

  @JsonKey(name: 'price_change_percentage_24h')
  final Map<String, double?>? priceChangePercentage24h;

  @JsonKey(name: 'market_cap')
  final String? marketCap;

  @JsonKey(name: 'total_volume')
  final String? totalVolume;

  final String? sparkline;
  
  final TrendingCoinContentModel? content;

  TrendingCoinDataModel({
    this.price,
    this.priceChangePercentage24h,
    this.marketCap,
    this.totalVolume,
    this.sparkline,
    this.content,
  });

  double get priceChangeUsd => priceChangePercentage24h?['usd'] ?? 0.0;

  factory TrendingCoinDataModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingCoinDataModelFromJson(json);
}

@JsonSerializable()
class TrendingCoinContentModel {
  final String? title;
  final String? description;

  TrendingCoinContentModel({
    this.title,
    this.description,
  });

  factory TrendingCoinContentModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingCoinContentModelFromJson(json);
}