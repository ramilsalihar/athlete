// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyHiveModelAdapter extends TypeAdapter<MyHiveModel> {
  @override
  final int typeId = 1;

  @override
  MyHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyHiveModel(
      id: fields[0] as int,
      image: fields[1] as String,
      name: fields[2] as String,
      time: fields[3] as int,
      kcal: fields[4] as int,
      description: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.kcal)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
