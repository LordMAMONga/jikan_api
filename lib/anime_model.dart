import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@JsonSerializable()
class AnimeModel {
  final String title;
  final double? score;

  @JsonKey(name: 'aired_string')
  final String? airedDate;

  final AnimeImages images;

  AnimeModel({
    required this.title,
    this.score,
    this.airedDate,
    required this.images,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) => _$AnimeModelFromJson(json);
}

@JsonSerializable()
class AnimeImages {
  final AnimeJpg jpg;
  AnimeImages({required this.jpg});
  factory AnimeImages.fromJson(Map<String, dynamic> json) => _$AnimeImagesFromJson(json);
}

@JsonSerializable()
class AnimeJpg {
  @JsonKey(name: 'large_image_url')
  final String largeImageUrl;
  AnimeJpg({required this.largeImageUrl});
  factory AnimeJpg.fromJson(Map<String, dynamic> json) => _$AnimeJpgFromJson(json);
}