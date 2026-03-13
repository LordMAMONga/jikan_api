import 'package:flutter/material.dart';
import 'package:jikan_api/anime__rating_screen.dart';

import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimeRatingScreen(),
    ),
  );
}
