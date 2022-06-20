import 'package:json_annotation/json_annotation.dart';
part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetail {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'overview', defaultValue: '')
  String? overview;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date', defaultValue: '')
  String releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  @JsonKey(name: 'vote_average', defaultValue: 0.0)
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  MovieDetail(
      {this.adult,
        this.backdropPath,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        required this.releaseDate,
        this.revenue,
        this.runtime,
        this.status,
        this.tagline,
        this.title,
        this.video,
        required this.voteAverage,
        this.voteCount});

  factory MovieDetail.fromJson(Map<String, dynamic> json) => _$MovieDetailFromJson(json);
}

@JsonSerializable()
class Genres {
  int? id;
  String? name;
  Genres({this.id, this.name});
  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
}
