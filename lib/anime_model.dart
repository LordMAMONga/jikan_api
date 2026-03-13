import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class AnimeModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final double? score;

  @HiveField(2)
  @JsonKey(name: 'aired_string')
  final String? airedDate;
  @HiveField(3)
  final AnimeImages images;

  AnimeModel({
    required this.title,
    this.score,
    this.airedDate,
    required this.images,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) => _$AnimeModelFromJson(json);
}

@HiveType(typeId: 1)
@JsonSerializable()
class AnimeImages {
  @HiveField(0)
  final AnimeJpg jpg;
  AnimeImages({required this.jpg});
  factory AnimeImages.fromJson(Map<String, dynamic> json) => _$AnimeImagesFromJson(json);
}

@HiveType(typeId: 2)
@JsonSerializable()
class AnimeJpg {
  @HiveField(0)
  @JsonKey(name: 'large_image_url')
  final String largeImageUrl;
  AnimeJpg({required this.largeImageUrl});
  factory AnimeJpg.fromJson(Map<String, dynamic> json) => _$AnimeJpgFromJson(json);
}