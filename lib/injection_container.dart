import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<GetIt> init() async {
  /// Khusus Bloc / Cubit
  // if (!sl.isRegistered<CourseCubit>()) {
  //   sl.registerLazySingleton(() => CourseCubit());
  // }

  /// Khusus Repository
  // if (!sl.isRegistered<CourseRepository>()) {
  //   sl.registerLazySingleton(() => CourseRepositoryImpl());
  // }

  /// Khusus Data sources
  /// Khusus Core
  if (!sl.isRegistered<GlobalKey<NavigatorState>>()) {
    sl.registerLazySingleton(() => GlobalKey<NavigatorState>());
  }

  ///Khusus Create DB
  // final dbCliented = DbClient();
  // final db = await dbCliented();
  // if (!sl.isRegistered<Database>()) {
  //   sl.registerLazySingleton(() => db);
  // }
  return sl;
}
