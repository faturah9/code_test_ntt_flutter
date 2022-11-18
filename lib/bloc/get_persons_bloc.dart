import 'package:faturcodetestnttflutter/model/person_model/person_response.dart';
import 'package:faturcodetestnttflutter/repository/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class PersonsListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject =
      BehaviorSubject<PersonResponse>();

  getPersons() async {
    PersonResponse response = await _repository.getPersons();
    _subject.sink.add(response);
    if (kDebugMode) {
      print(response);
    }
  }

  void drainStream() async {
    await _subject.drain();
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PersonResponse> get subject => _subject;
}

final personsBloc = PersonsListBloc();
