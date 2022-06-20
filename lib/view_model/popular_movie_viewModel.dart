import 'package:flutter/material.dart';
import 'package:untitled/model/movie_detail_model.dart';
import 'package:untitled/model/movie_model.dart';
import 'package:untitled/model/popular_movie.dart';
import 'package:untitled/respository/movie.dart';

class PopularMovieViewModel with ChangeNotifier {
  List<Movie> listMovie = [];
  PopularMovie popularMovie = PopularMovie();
  MovieRespository repository = MovieRespository();
  MovieDetail? movieDetail;
  bool loading = true;

  void getPopularMovie() async {
    loading = true;
    notifyListeners();
    final res = await repository.getMovie();
    listMovie = res.results ?? [];
    loading = false;
    notifyListeners();
  }

  void getMovieDetails(id) async {
    loading = true;
    notifyListeners();
    movieDetail = await repository.getMovieDetail(id);
    loading = false;
    notifyListeners();
  }
}
