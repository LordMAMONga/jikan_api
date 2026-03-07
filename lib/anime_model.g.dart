// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

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

AnimeImages _$AnimeImagesFromJson(Map<String, dynamic> json) =>
    AnimeImages(jpg: AnimeJpg.fromJson(json['jpg'] as Map<String, dynamic>));

Map<String, dynamic> _$AnimeImagesToJson(AnimeImages instance) =>
    <String, dynamic>{'jpg': instance.jpg};

AnimeJpg _$AnimeJpgFromJson(Map<String, dynamic> json) =>
    AnimeJpg(largeImageUrl: json['large_image_url'] as String);

Map<String, dynamic> _$AnimeJpgToJson(AnimeJpg instance) => <String, dynamic>{
  'large_image_url': instance.largeImageUrl,
};
