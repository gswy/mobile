// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfoAdapter extends TypeAdapter<Info> {
  @override
  final typeId = 2;

  @override
  Info read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Info(
      id: (fields[0] as num?)?.toInt(),
      mode: (fields[2] as num).toInt(),
      sourceId: (fields[3] as num).toInt(),
      targetId: (fields[4] as num).toInt(),
      status: (fields[6] as num).toInt(),
      type: (fields[5] as num).toInt(),
      content: fields[7] as String,
      createdAt: (fields[8] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Info obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.mode)
      ..writeByte(3)
      ..write(obj.sourceId)
      ..writeByte(4)
      ..write(obj.targetId)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.content)
      ..writeByte(8)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
