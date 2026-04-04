// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinDetailsModelAdapter extends TypeAdapter<CoinDetailsModel> {
  @override
  final typeId = 2;

  @override
  CoinDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinDetailsModel(
      id: fields[0] as String,
      symbol: fields[1] as String,
      name: fields[2] as String,
      image: fields[3] as CoinImageModel,
      marketCapRank: (fields[4] as num?)?.toInt(),
      marketData: fields[5] as MarketDataModel,
      description: fields[6] as CoinDescriptionModel?,
    );
  }

  @override
  void write(BinaryWriter writer, CoinDetailsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.marketCapRank)
      ..writeByte(5)
      ..write(obj.marketData)
      ..writeByte(6)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoinImageModelAdapter extends TypeAdapter<CoinImageModel> {
  @override
  final typeId = 3;

  @override
  CoinImageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinImageModel(
      thumb: fields[0] as String,
      small: fields[1] as String,
      large: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CoinImageModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.thumb)
      ..writeByte(1)
      ..write(obj.small)
      ..writeByte(2)
      ..write(obj.large);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinImageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoinDescriptionModelAdapter extends TypeAdapter<CoinDescriptionModel> {
  @override
  final typeId = 4;

  @override
  CoinDescriptionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinDescriptionModel(en: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, CoinDescriptionModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinDescriptionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrencyValueModelAdapter extends TypeAdapter<CurrencyValueModel> {
  @override
  final typeId = 5;

  @override
  CurrencyValueModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyValueModel(usd: (fields[0] as num?)?.toDouble());
  }

  @override
  void write(BinaryWriter writer, CurrencyValueModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.usd);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyValueModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MarketDataModelAdapter extends TypeAdapter<MarketDataModel> {
  @override
  final typeId = 6;

  @override
  MarketDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MarketDataModel(
      currentPrice: fields[0] as CurrencyValueModel,
      priceChangePercentage24h: (fields[1] as num?)?.toDouble(),
      marketCap: fields[2] as CurrencyValueModel,
      totalVolume: fields[3] as CurrencyValueModel,
      circulatingSupply: (fields[4] as num?)?.toDouble(),
      maxSupply: (fields[5] as num?)?.toDouble(),
      ath: fields[6] as CurrencyValueModel,
      high24h: fields[7] as CurrencyValueModel,
      low24h: fields[8] as CurrencyValueModel,
      priceChangePercentage7d: (fields[9] as num?)?.toDouble(),
      priceChangePercentage30d: (fields[10] as num?)?.toDouble(),
      priceChangePercentage1y: (fields[11] as num?)?.toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, MarketDataModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.currentPrice)
      ..writeByte(1)
      ..write(obj.priceChangePercentage24h)
      ..writeByte(2)
      ..write(obj.marketCap)
      ..writeByte(3)
      ..write(obj.totalVolume)
      ..writeByte(4)
      ..write(obj.circulatingSupply)
      ..writeByte(5)
      ..write(obj.maxSupply)
      ..writeByte(6)
      ..write(obj.ath)
      ..writeByte(7)
      ..write(obj.high24h)
      ..writeByte(8)
      ..write(obj.low24h)
      ..writeByte(9)
      ..write(obj.priceChangePercentage7d)
      ..writeByte(10)
      ..write(obj.priceChangePercentage30d)
      ..writeByte(11)
      ..write(obj.priceChangePercentage1y);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarketDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDetailsModel _$CoinDetailsModelFromJson(Map<String, dynamic> json) =>
    CoinDetailsModel(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: CoinImageModel.fromJson(json['image'] as Map<String, dynamic>),
      marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
      marketData: MarketDataModel.fromJson(
        json['market_data'] as Map<String, dynamic>,
      ),
      description: json['description'] == null
          ? null
          : CoinDescriptionModel.fromJson(
              json['description'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CoinDetailsModelToJson(CoinDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'market_cap_rank': instance.marketCapRank,
      'market_data': instance.marketData,
      'description': instance.description,
    };

CoinImageModel _$CoinImageModelFromJson(Map<String, dynamic> json) =>
    CoinImageModel(
      thumb: json['thumb'] as String,
      small: json['small'] as String,
      large: json['large'] as String,
    );

Map<String, dynamic> _$CoinImageModelToJson(CoinImageModel instance) =>
    <String, dynamic>{
      'thumb': instance.thumb,
      'small': instance.small,
      'large': instance.large,
    };

CoinDescriptionModel _$CoinDescriptionModelFromJson(
  Map<String, dynamic> json,
) => CoinDescriptionModel(en: json['en'] as String?);

Map<String, dynamic> _$CoinDescriptionModelToJson(
  CoinDescriptionModel instance,
) => <String, dynamic>{'en': instance.en};

CurrencyValueModel _$CurrencyValueModelFromJson(Map<String, dynamic> json) =>
    CurrencyValueModel(usd: (json['usd'] as num?)?.toDouble());

Map<String, dynamic> _$CurrencyValueModelToJson(CurrencyValueModel instance) =>
    <String, dynamic>{'usd': instance.usd};

MarketDataModel _$MarketDataModelFromJson(Map<String, dynamic> json) =>
    MarketDataModel(
      currentPrice: CurrencyValueModel.fromJson(
        json['current_price'] as Map<String, dynamic>,
      ),
      priceChangePercentage24h: (json['price_change_percentage_24h'] as num?)
          ?.toDouble(),
      marketCap: CurrencyValueModel.fromJson(
        json['market_cap'] as Map<String, dynamic>,
      ),
      totalVolume: CurrencyValueModel.fromJson(
        json['total_volume'] as Map<String, dynamic>,
      ),
      circulatingSupply: (json['circulating_supply'] as num?)?.toDouble(),
      maxSupply: (json['max_supply'] as num?)?.toDouble(),
      ath: CurrencyValueModel.fromJson(json['ath'] as Map<String, dynamic>),
      high24h: CurrencyValueModel.fromJson(
        json['high_24h'] as Map<String, dynamic>,
      ),
      low24h: CurrencyValueModel.fromJson(
        json['low_24h'] as Map<String, dynamic>,
      ),
      priceChangePercentage7d: (json['price_change_percentage_7d'] as num?)
          ?.toDouble(),
      priceChangePercentage30d: (json['price_change_percentage_30d'] as num?)
          ?.toDouble(),
      priceChangePercentage1y: (json['price_change_percentage_1y'] as num?)
          ?.toDouble(),
    );

Map<String, dynamic> _$MarketDataModelToJson(MarketDataModel instance) =>
    <String, dynamic>{
      'current_price': instance.currentPrice,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'market_cap': instance.marketCap,
      'total_volume': instance.totalVolume,
      'circulating_supply': instance.circulatingSupply,
      'max_supply': instance.maxSupply,
      'ath': instance.ath,
      'high_24h': instance.high24h,
      'low_24h': instance.low24h,
      'price_change_percentage_7d': instance.priceChangePercentage7d,
      'price_change_percentage_30d': instance.priceChangePercentage30d,
      'price_change_percentage_1y': instance.priceChangePercentage1y,
    };
