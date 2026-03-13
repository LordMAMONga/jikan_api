import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:jikan_api/anime_model.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dio => Dio();

  @preResolve
  @singleton
  Future<Box<AnimeModel>> get animeBox async {
    await Hive.initFlutter();

    Hive.registerAdapter(AnimeModelAdapter());
    Hive.registerAdapter(AnimeImagesAdapter());
    Hive.registerAdapter(AnimeJpgAdapter());

    return await Hive.openBox<AnimeModel>('anime_box');
  }
}