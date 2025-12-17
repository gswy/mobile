// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MineAdapter extends TypeAdapter<Mine> {
  @override
  final typeId = 4;

  @override
  Mine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mine(
      id: (fields[0] as num).toInt(),
      nickname: fields[1] as String,
      username: fields[2] as String,
      phone: fields[3] as String?,
      email: fields[4] as String?,
      avatar: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Mine obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nickname)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.avatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
