// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_link_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedLinkModelAdapter extends TypeAdapter<SavedLinkModel> {
  @override
  final int typeId = 0;

  @override
  SavedLinkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedLinkModel(
      id: fields[0] as String,
      name: fields[1] as String,
      ddi: fields[2] as String,
      phone: fields[3] as String,
      message: fields[4] as String?,
      link: fields[5] as String,
      createdAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SavedLinkModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.ddi)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.message)
      ..writeByte(5)
      ..write(obj.link)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedLinkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
