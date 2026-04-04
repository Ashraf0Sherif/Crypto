import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_details_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class CoinDetailsModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String symbol;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final CoinImageModel image;
  
  @JsonKey(name: 'market_cap_rank')
  @HiveField(4)
  final int? marketCapRank;

  @JsonKey(name: 'market_data')
  @HiveField(5)
  final MarketDataModel marketData;

  @JsonKey(name: 'description')
  @HiveField(6)
  final CoinDescriptionModel? description;

  CoinDetailsModel({
    required this.id, required this.symbol, required this.name,
    required this.image, this.marketCapRank, required this.marketData,
    this.description,
  });

  String get descriptionEn => description?.en ?? 'No description available.';

  factory CoinDetailsModel.fromJson(Map<String, dynamic> json) => _$CoinDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoinDetailsModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 3)
class CoinImageModel {
  @HiveField(0)
  final String thumb;
  @HiveField(1)
  final String small;
  @HiveField(2)
  final String large;

  CoinImageModel({required this.thumb, required this.small, required this.large});

  factory CoinImageModel.fromJson(Map<String, dynamic> json) => _$CoinImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoinImageModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 4)
class CoinDescriptionModel {
  @HiveField(0)
  final String? en;

  CoinDescriptionModel({this.en});

  factory CoinDescriptionModel.fromJson(Map<String, dynamic> json) => _$CoinDescriptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoinDescriptionModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 5)
class CurrencyValueModel {
  @HiveField(0)
  final double? usd;

  CurrencyValueModel({this.usd});

  factory CurrencyValueModel.fromJson(Map<String, dynamic> json) => _$CurrencyValueModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyValueModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 6)
class MarketDataModel {
  @JsonKey(name: 'current_price')
  @HiveField(0)
  final CurrencyValueModel currentPrice;

  @JsonKey(name: 'price_change_percentage_24h')
  @HiveField(1)
  final double? priceChangePercentage24h;

  @JsonKey(name: 'market_cap')
  @HiveField(2)
  final CurrencyValueModel marketCap;

  @JsonKey(name: 'total_volume')
  @HiveField(3)
  final CurrencyValueModel totalVolume;

  @JsonKey(name: 'circulating_supply')
  @HiveField(4)
  final double? circulatingSupply;

  @JsonKey(name: 'max_supply')
  @HiveField(5)
  final double? maxSupply;

  @HiveField(6)
  final CurrencyValueModel ath;

  @JsonKey(name: 'high_24h')
  @HiveField(7)
  final CurrencyValueModel high24h;

  @JsonKey(name: 'low_24h')
  @HiveField(8)
  final CurrencyValueModel low24h;

  @JsonKey(name: 'price_change_percentage_7d')
  @HiveField(9)
  final double? priceChangePercentage7d;

  @JsonKey(name: 'price_change_percentage_30d')
  @HiveField(10)
  final double? priceChangePercentage30d;

  @JsonKey(name: 'price_change_percentage_1y')
  @HiveField(11)
  final double? priceChangePercentage1y;

  MarketDataModel({
    required this.currentPrice, this.priceChangePercentage24h, required this.marketCap,
    required this.totalVolume, this.circulatingSupply, this.maxSupply, required this.ath,
    required this.high24h, required this.low24h, this.priceChangePercentage7d,
    this.priceChangePercentage30d, this.priceChangePercentage1y,
  });

  double get currentPriceUsd => currentPrice.usd ?? 0;
  double get marketCapUsd => marketCap.usd ?? 0;
  double get totalVolumeUsd => totalVolume.usd ?? 0;
  double get athUsd => ath.usd ?? 0;
  double get high24hUsd => high24h.usd ?? 0;
  double get low24hUsd => low24h.usd ?? 0;

  factory MarketDataModel.fromJson(Map<String, dynamic> json) => _$MarketDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$MarketDataModelToJson(this);
}