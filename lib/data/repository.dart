import 'package:dio/dio.dart';
import 'package:jikan_api/anime_model.dart';

class Repository {
  Future<List<AnimeModel>> getHttp() async {
    final dio = Dio();
    final response = await dio.get('https://api.jikan.moe/v4/top/anime');
    List<dynamic> data = response.data['data'];
    List<AnimeModel> list = data.map((e) => AnimeModel.fromJson(e)).toList();
    return list;
  }
}
