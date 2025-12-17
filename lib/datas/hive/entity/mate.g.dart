// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MateAdapter extends TypeAdapter<Mate> {
  @override
  final typeId = 3;

  @override
  Mate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mate(
      id: (fields[0] as num).toInt(),
      avatar: fields[1] as String?,
      nickname: fields[2] as String,
      username: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Mate obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.avatar)
      ..writeByte(2)
      ..write(obj.nickname)
      ..writeByte(3)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
