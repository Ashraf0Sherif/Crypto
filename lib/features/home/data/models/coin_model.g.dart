// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinModelAdapter extends TypeAdapter<CoinModel> {
  @override
  final typeId = 0;

  @override
  CoinModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinModel(
      id: fields[0] as String,
      symbol: fields[1] as String,
      name: fields[2] as String,
      image: fields[3] as String,
      currentPrice: (fields[4] as num).toDouble(),
      priceChangePercentage24h: (fields[5] as num).toDouble(),
      sparklineIn7d: fields[6] as SparklineData,
    );
  }

  @override
  void write(BinaryWriter writer, CoinModel obj) {
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
      ..write(obj.currentPrice)
      ..writeByte(5)
      ..write(obj.priceChangePercentage24h)
      ..writeByte(6)
      ..write(obj.sparklineIn7d);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SparklineDataAdapter extends TypeAdapter<SparklineData> {
  @override
  final typeId = 1;

  @override
  SparklineData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SparklineData(price: (fields[0] as List).cast<double>());
  }

  @override
  void write(BinaryWriter writer, SparklineData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SparklineDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
