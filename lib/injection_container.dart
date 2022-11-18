import 'package:faturcodetestnttflutter/bloc/get_casts_bloc.dart';
import 'package:faturcodetestnttflutter/bloc/get_genres_bloc.dart';
import 'package:faturcodetestnttflutter/bloc/get_movie_detail_bloc.dart';
import 'package:faturcodetestnttflutter/bloc/get_movie_similar_bloc.dart';
import 'package:faturcodetestnttflutter/bloc/get_movie_videos_bloc.dart';
import 'package:faturcodetestnttflutter/bloc/get_movies_bloc.dart';
import 'package:faturcodetestnttflutter/bloc/get_movies_byGenre_bloc.dart';
import 'package:faturcodetestnttflutter/bloc/get_now_playing_bloc.dart';
import 'package:faturcodetestnttflutter/bloc/get_persons_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<GetIt> init() async {
  /// Khusus Bloc / Cubit
  if (!sl.isRegistered<CastsBloc>()) {
    sl.registerLazySingleton(() => CastsBloc());
  }
  if (!sl.isRegistered<GenresListBloc>()) {
    sl.registerLazySingleton(() => GenresListBloc());
  }
  if (!sl.isRegistered<MovieDetailBloc>()) {
    sl.registerLazySingleton(() => MovieDetailBloc());
  }
  if (!sl.isRegistered<SimilarMoviesBloc>()) {
    sl.registerLazySingleton(() => SimilarMoviesBloc());
  }
  if (!sl.isRegistered<MovieVideosBloc>()) {
    sl.registerLazySingleton(() => MovieVideosBloc());
  }
  if (!sl.isRegistered<MoviesListBloc>()) {
    sl.registerLazySingleton(() => MoviesListBloc());
  }
  if (!sl.isRegistered<MoviesListByGenreBloc>()) {
    sl.registerLazySingleton(() => MoviesListByGenreBloc());
  }
  if (!sl.isRegistered<NowPlayingListBloc>()) {
    sl.registerLazySingleton(() => NowPlayingListBloc());
  }
  if (!sl.isRegistered<PersonsListBloc>()) {
    sl.registerLazySingleton(() => PersonsListBloc());
  }

  /// Khusus Repository

  /// Khusus Data sources
  /// Khusus Core
  if (!sl.isRegistered<GlobalKey<NavigatorState>>()) {
    sl.registerLazySingleton(() => GlobalKey<NavigatorState>());
  }

  ///Khusus Create DB
  return sl;
}
