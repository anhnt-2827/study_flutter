import 'package:flutter/material.dart';
import 'package:untitled/screens/home/home.dart';
import 'package:untitled/screens/about.dart';
import 'package:untitled/screens/movie_detail_screen.dart';
import 'package:untitled/screens/settings.dart';
import 'package:provider/provider.dart';
import 'package:untitled/view_model/popular_movie_viewModel.dart';
import 'package:untitled/view_model/ui.dart';

class Routes {
  static const String home = '/';
  static const String movieDetail = '/movie-detail-screen';
  static const String about = '/about';
  static const String settings = '/settings';
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UI()),
        ChangeNotifierProvider(create: (_) => PopularMovieViewModel()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          Routes.home: (context) => const Home(),
          Routes.movieDetail: (context) => const MovieDetailScreen(),
          Routes.about: (context) => const AboutScreen(),
          Routes.settings: (context) => Settings(),
        },
      ),
    );
  }
}
