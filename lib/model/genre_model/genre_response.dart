import 'package:faturcodetestnttflutter/model/genre_model/genre.dart';

class GenreResponse {
  final List<GenreModel> genres;
  final String error;

  GenreResponse(this.genres, this.error);

  GenreResponse.fromJson(Map<String, dynamic> json)
      : genres = (json["genres"] as List)
            .map((i) => GenreModel.fromJson(i))
            .toList(),
        error = "";

  GenreResponse.withError(String errorValue)
      : genres = [],
        error = errorValue;
}
