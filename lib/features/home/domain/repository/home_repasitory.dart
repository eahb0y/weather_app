import 'package:dartz/dartz.dart';
import 'package:inhetited_test/core/error/failure.dart';
import 'package:inhetited_test/features/home/domain/entity/current_weather_request_entity.dart';
import 'package:inhetited_test/features/home/domain/entity/current_weather_response_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, CurrentWeatherResponseEntity>> getCurrentWeather(
      CurrentWeatherRequestEntity request);
}
