import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jikan_api/data/repository.dart';
import 'package:meta/meta.dart';

import '../anime_model.dart';

part 'anime_state.dart';

@injectable
class AnimeCubit extends Cubit<AnimeState> {
  final Repository repository;
  AnimeCubit(this.repository) : super(AnimeState());
  
  Future<void> fetchAnime() async{
    emit(AnimeState(isLoading: true));
    try{
      final list = await repository.getHttp();
      emit(AnimeState(isLoading: false, list: list));
    }catch(e){
      emit(AnimeState(isLoading: false, error: e.toString()));
    }

    final response = await repository.getHttp();

    emit(AnimeState(isLoading: false, list: response));
  }
}
