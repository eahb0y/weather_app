import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:inhetited_test/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:inhetited_test/features/home/data/data_source/remote_data_source/home_remote_data_source_place.dart';
import 'package:inhetited_test/features/home/data/repository/home_repository_impl.dart';
import 'package:inhetited_test/features/home/domain/repository/home_repasitory.dart';
import 'package:inhetited_test/features/home/domain/usecase/current_place_usecase.dart';
import 'package:inhetited_test/features/home/domain/usecase/current_weather_usecase.dart';
import 'package:inhetited_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:inhetited_test/router/app_routes.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(
    () => Dio()
      ..interceptors.addAll([
        LogInterceptor(
          request: kDebugMode,
          responseBody: kDebugMode,
          error: kDebugMode,
          requestBody: kDebugMode,
        ),
        chuck.getDioInterceptor(),
      ])
      ..options.contentType = 'application/json',
  );

  _authFeature();
}

void _authFeature() {
  /// Presentation
  sl.registerFactory(() => HomeBloc(
        sl(),
        sl(),
      ));

  /// UseCases
  sl.registerLazySingleton<HomeUseCase>(() => HomeUseCase(sl()));
  sl.registerLazySingleton<CurrentPlaceUseCase>(
      () => CurrentPlaceUseCase(sl()));

  ///Repositories
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      sl(),
      sl(),
    ),
  );

  /// Data and Network
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(
      sl(),
    ),
  );
  sl.registerLazySingleton<HomeRemoteDataSourcePlace>(
    () => HomeRemoteDataSourcePlace(
      sl(),
    ),
  );
}
