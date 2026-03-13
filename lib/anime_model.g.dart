// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeModelAdapter extends TypeAdapter<AnimeModel> {
  @override
  final int typeId = 0;

  @override
  AnimeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeModel(
      title: fields[0] as String,
      score: fields[1] as double?,
      airedDate: fields[2] as String?,
      images: fields[3] as AnimeImages,
    );
  }

  @override
  void write(BinaryWriter writer, AnimeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.airedDate)
      ..writeByte(3)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnimeImagesAdapter extends TypeAdapter<AnimeImages> {
  @override
  final int typeId = 1;

  @override
  AnimeImages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeImages(
      jpg: fields[0] as AnimeJpg,
    );
  }

  @override
  void write(BinaryWriter writer, AnimeImages obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.jpg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeImagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnimeJpgAdapter extends TypeAdapter<AnimeJpg> {
  @override
  final int typeId = 2;

  @override
  AnimeJpg read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeJpg(
      largeImageUrl: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AnimeJpg obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.largeImageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeJpgAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => AnimeModel(
      title: json['title'] as String,
      score: (json['score'] as num?)?.toDouble(),
      airedDate: json['aired_string'] as String?,
      images: AnimeImages.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeModelToJson(AnimeModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'score': instance.score,
      'aired_string': instance.airedDate,
      'images': instance.images,
    };

AnimeImages _$AnimeImagesFromJson(Map<String, dynamic> json) => AnimeImages(
      jpg: AnimeJpg.fromJson(json['jpg'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeImagesToJson(AnimeImages instance) =>
    <String, dynamic>{
      'jpg': instance.jpg,
    };

AnimeJpg _$AnimeJpgFromJson(Map<String, dynamic> json) => AnimeJpg(
      largeImageUrl: json['large_image_url'] as String,
    );

Map<String, dynamic> _$AnimeJpgToJson(AnimeJpg instance) => <String, dynamic>{
      'large_image_url': instance.largeImageUrl,
    };
