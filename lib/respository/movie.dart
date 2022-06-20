import 'dart:convert';

import 'package:untitled/model/movie_detail_model.dart';
import 'package:untitled/model/popular_movie.dart';
import 'package:untitled/respository/apis.dart';

class MovieRespository {
  Apis apis = Apis();

  Future<PopularMovie> getMovie() async {
    final res = await apis.getRequest('/popular');
    return PopularMovie.fromJson(jsonDecode(res.body));
  }

  Future<MovieDetail> getMovieDetail(id) async {
    final res = await apis.getRequest('/$id');
    return MovieDetail.fromJson(jsonDecode(res.body));
  }
}
