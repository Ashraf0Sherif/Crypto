// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_chart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinChartModelAdapter extends TypeAdapter<CoinChartModel> {
  @override
  final typeId = 7;

  @override
  CoinChartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinChartModel(prices: (fields[0] as List).cast<ChartDataPoint>());
  }

  @override
  void write(BinaryWriter writer, CoinChartModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.prices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinChartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChartDataPointAdapter extends TypeAdapter<ChartDataPoint> {
  @override
  final typeId = 8;

  @override
  ChartDataPoint read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChartDataPoint(
      timestamp: (fields[0] as num).toDouble(),
      price: (fields[1] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, ChartDataPoint obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.timestamp)
      ..writeByte(1)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChartDataPointAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
