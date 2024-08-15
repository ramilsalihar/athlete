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
      tems: (fields[3] as List).cast<String>(),
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
      ..write(obj.tems);
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
