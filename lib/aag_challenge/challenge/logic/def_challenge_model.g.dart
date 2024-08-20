// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'def_challenge_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DefChallengeModelAdapter extends TypeAdapter<DefChallengeModel> {
  @override
  final int typeId = 2;

  @override
  DefChallengeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DefChallengeModel(
      level: fields[0] as int,
      challengeComplete: fields[1] as int,
      myChallenge: fields[2] as int,
      kcalBurned: fields[3] as int,
      currentChallenge: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DefChallengeModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.challengeComplete)
      ..writeByte(2)
      ..write(obj.myChallenge)
      ..writeByte(3)
      ..write(obj.kcalBurned)
      ..writeByte(4)
      ..write(obj.currentChallenge);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DefChallengeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
