// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sh_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShHiveModelAdapter extends TypeAdapter<ShHiveModel> {
  @override
  final int typeId = 0;

  @override
  ShHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShHiveModel(
      title: fields[0] as String,
      imageUrl: fields[1] as String,
      totalDays: fields[2] as int,
      times: (fields[3] as Map).cast<String, bool>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.totalDays)
      ..writeByte(3)
      ..write(obj.times);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeightModelAdapter extends TypeAdapter<WeightModel> {
  @override
  final int typeId = 3;

  @override
  WeightModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeightModel(
      weight: fields[0] as double,
      dateAdded: fields[1] as String,
      stats: (fields[2] as Map).cast<String, int>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeightModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.weight)
      ..writeByte(1)
      ..write(obj.dateAdded)
      ..writeByte(2)
      ..write(obj.stats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeightModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
