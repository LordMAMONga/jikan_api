import 'package:bloc/bloc.dart';
import 'package:jikan_api/data/repository.dart';
import 'package:meta/meta.dart';

import '../anime_model.dart';

part 'anime_state.dart';

class AnimeCubit extends Cubit<AnimeState> {
  final Repository repository = Repository();
  AnimeCubit() : super(AnimeState());

  Future<void> fetchAnime() async{
    emit(AnimeState(isLoading: true));

    final repository = Repository();

    final response = await repository.getHttp();

    emit(AnimeState(isLoading: false, list: response));
  }
}
