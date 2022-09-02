// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalized_contact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonalizedContactAdapter extends TypeAdapter<PersonalizedContact> {
  @override
  final int typeId = 1;

  @override
  PersonalizedContact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalizedContact()
      ..name = fields[0] as String
      ..number = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, PersonalizedContact obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalizedContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
