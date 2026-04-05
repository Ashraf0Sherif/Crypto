// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingCoinModel _$TrendingCoinModelFromJson(Map<String, dynamic> json) =>
    TrendingCoinModel(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
      thumb: json['thumb'] as String,
      large: json['large'] as String,
      data: TrendingCoinDataModel.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$TrendingCoinModelToJson(TrendingCoinModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'market_cap_rank': instance.marketCapRank,
      'thumb': instance.thumb,
      'large': instance.large,
      'data': instance.data,
    };

TrendingCoinDataModel _$TrendingCoinDataModelFromJson(
  Map<String, dynamic> json,
) => TrendingCoinDataModel(
  price: (json['price'] as num?)?.toDouble(),
  priceChangePercentage24h:
      (json['price_change_percentage_24h'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num?)?.toDouble()),
      ),
  marketCap: json['market_cap'] as String?,
  totalVolume: json['total_volume'] as String?,
  sparkline: json['sparkline'] as String?,
  content: json['content'] == null
      ? null
      : TrendingCoinContentModel.fromJson(
          json['content'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$TrendingCoinDataModelToJson(
  TrendingCoinDataModel instance,
) => <String, dynamic>{
  'price': instance.price,
  'price_change_percentage_24h': instance.priceChangePercentage24h,
  'market_cap': instance.marketCap,
  'total_volume': instance.totalVolume,
  'sparkline': instance.sparkline,
  'content': instance.content,
};

TrendingCoinContentModel _$TrendingCoinContentModelFromJson(
  Map<String, dynamic> json,
) => TrendingCoinContentModel(
  title: json['title'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$TrendingCoinContentModelToJson(
  TrendingCoinContentModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
};
