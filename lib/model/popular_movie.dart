import 'package:untitled/model/movie_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_movie.g.dart';

@JsonSerializable()
class PopularMovie {
  int? page;
  List<Movie>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  PopularMovie({this.page, this.results, this.totalPages, this.totalResults});
  factory PopularMovie.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieFromJson(json);
}
