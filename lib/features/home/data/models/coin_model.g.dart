// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) => CoinModel(
  id: json['id'] as String,
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  currentPrice: (json['current_price'] as num).toDouble(),
  priceChangePercentage24h: (json['price_change_percentage_24h'] as num)
      .toDouble(),
  sparklineIn7d: SparklineData.fromJson(
    json['sparkline_in_7d'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CoinModelToJson(CoinModel instance) => <String, dynamic>{
  'id': instance.id,
  'symbol': instance.symbol,
  'name': instance.name,
  'image': instance.image,
  'current_price': instance.currentPrice,
  'price_change_percentage_24h': instance.priceChangePercentage24h,
  'sparkline_in_7d': instance.sparklineIn7d,
};

SparklineData _$SparklineDataFromJson(Map<String, dynamic> json) =>
    SparklineData(
      price: (json['price'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$SparklineDataToJson(SparklineData instance) =>
    <String, dynamic>{'price': instance.price};
