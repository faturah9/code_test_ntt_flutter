import 'package:faturcodetestnttflutter/model/cast_model/cast_response.dart';
import 'package:faturcodetestnttflutter/repository/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CastsBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<CastResponse> _subject =
      BehaviorSubject<CastResponse>();

  getCasts(int id) async {
    CastResponse response = await _repository.getCasts(id);
    _subject.sink.add(response);
    if (kDebugMode) {
      print(response);
    }
  }

  void drainStream() async {
    await _subject.drain();
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<CastResponse> get subject => _subject;
}

final castsBloc = CastsBloc();
