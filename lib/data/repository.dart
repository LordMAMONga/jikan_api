import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:jikan_api/anime_model.dart';

@injectable
class Repository {
  final Box<AnimeModel> box;
  final Dio dio;
  Repository(this.dio,this.box);


  Future<List<AnimeModel>> getHttp() async {
    try{
      final dio = Dio();
      final response = await dio.get('https://api.jikan.moe/v4/top/anime');
      List<dynamic> data = response.data['data'];
      List<AnimeModel> list = data.map((e) => AnimeModel.fromJson(e)).toList();

      await box.clear();
      await box.addAll(list);
      return list;
    }catch(e){
      return box.values.toList();
    }

  }
}
