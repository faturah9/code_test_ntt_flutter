import 'package:faturcodetestnttflutter/model/company_model/company.dart';
import 'package:faturcodetestnttflutter/model/genre_model/genre.dart';

class MovieDetail {
  final int id;
  final bool adult;
  final int budget;
  final List<GenreModel> genres;
  final List<CompanyModel> companies;
  final String releaseDate;
  final int runtime;

  MovieDetail(this.id, this.adult, this.budget, this.genres, this.companies,
      this.releaseDate, this.runtime);

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        adult = json["adult"],
        budget = json["budget"],
        genres = (json["genres"] as List)
            .map((i) => GenreModel.fromJson(i))
            .toList(),
        companies = (json["production_companies"] as List)
            .map((i) => CompanyModel.fromJson(i))
            .toList(),
        releaseDate = json["release_date"],
        runtime = json["runtime"];
}
