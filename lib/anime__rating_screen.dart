import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jikan_api/cubit/anime_cubit.dart';


class AnimeRatingScreen extends StatefulWidget {
  const AnimeRatingScreen({super.key});

  @override
  State<AnimeRatingScreen> createState() => _AnimeRatingScreenState();
}

class _AnimeRatingScreenState extends State<AnimeRatingScreen> {
  final cubit = AnimeCubit();

  @override
  void initState() {
    super.initState();
    cubit.fetchAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Top Anime',
          style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<AnimeCubit, AnimeState>(
        bloc: cubit,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.amberAccent));
          }

          if (state.list != null) {
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: state.list!.length,
              itemBuilder: (context, index) {
                final item = state.list![index];
                return _buildAnimeCard(item);
              },
            );
          }

          return const Center(
            child: Text("Нет данных", style: TextStyle(color: Colors.grey)),
          );
        },
      ),
    );
  }

  Widget _buildAnimeCard(item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                item.images.jpg.largeImageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.amberAccent, width: 1),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amberAccent, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      item.score?.toString() ?? '0.0',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 10,
              right: 10,
              child: Text(
                item.title,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}