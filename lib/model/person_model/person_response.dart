import 'package:faturcodetestnttflutter/model/person_model/person.dart';

class PersonResponse {
  final List<PersonModel> persons;
  final String error;

  PersonResponse(this.persons, this.error);

  PersonResponse.fromJson(Map<String, dynamic> json)
      : persons = (json["results"] as List)
            .map((i) => PersonModel.fromJson(i))
            .toList(),
        error = "";

  PersonResponse.withError(String errorValue)
      : persons = [],
        error = errorValue;
}
