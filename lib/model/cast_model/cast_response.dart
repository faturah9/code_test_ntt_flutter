import 'package:faturcodetestnttflutter/model/cast_model/cast.dart';

class CastResponse {
  final List<CastModel> casts;
  final String error;

  CastResponse(this.casts, this.error);

  CastResponse.fromJson(Map<String, dynamic> json)
      : casts =
            (json["cast"] as List).map((i) => CastModel.fromJson(i)).toList(),
        error = "";

  CastResponse.withError(String errorValue)
      : casts = [],
        error = errorValue;
}
