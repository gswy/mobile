// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatAdapter extends TypeAdapter<Chat> {
  @override
  final typeId = 1;

  @override
  Chat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chat(
      id: (fields[0] as num).toInt(),
      mode: (fields[1] as num).toInt(),
      name: fields[2] as String,
      unread: (fields[3] as num).toInt(),
      avatar: fields[4] as String?,
      content: fields[5] as String?,
      type: (fields[6] as num?)?.toInt(),
      lastedAt: (fields[7] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Chat obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.mode)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.unread)
      ..writeByte(4)
      ..write(obj.avatar)
      ..writeByte(5)
      ..write(obj.content)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.lastedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
