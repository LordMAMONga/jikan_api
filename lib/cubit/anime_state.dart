part of 'anime_cubit.dart';

class AnimeState {
  final bool isLoading;
  final String? error;
  final List<AnimeModel>? list;

  AnimeState({
    this.isLoading = false,
    this.error,
    this.list,
  });
}