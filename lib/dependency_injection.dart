import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:inherit_test/router/app_routes.dart';

final sl = GetIt.instance;


Future<void> init() async{
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
}
