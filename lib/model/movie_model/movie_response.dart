import 'movie.dart';

class MovieResponse {
  final List<MovieModel> movies;
  final String error;

  MovieResponse(this.movies, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map((i) => MovieModel.fromJson(i))
            .toList(),
        error = "";

  MovieResponse.withError(String errorValue)
      : movies = [],
        error = errorValue;
}
