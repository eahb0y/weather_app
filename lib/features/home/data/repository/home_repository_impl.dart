import 'package:dartz/dartz.dart';
import 'package:inhetited_test/core/error/failure.dart';
import 'package:inhetited_test/features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:inhetited_test/features/home/domain/entity/current_weather_request_entity.dart';
import 'package:inhetited_test/features/home/domain/entity/current_weather_response_entity.dart';
import 'package:inhetited_test/features/home/domain/repository/home_repasitory.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, CurrentWeatherResponseEntity>> getCurrentWeather(
      CurrentWeatherRequestEntity request) async{
    try {
      final result = await remoteDataSource.getCurrentWeather(
        request.lat,
        request.lon,
        request.key,
      );
      return Right(result.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
