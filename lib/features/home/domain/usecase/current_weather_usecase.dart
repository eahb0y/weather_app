import 'package:dartz/dartz.dart';
import 'package:inhetited_test/core/error/failure.dart';
import 'package:inhetited_test/core/usecase/usecase.dart';
import 'package:inhetited_test/features/home/domain/entity/current_weather_request_entity.dart';
import 'package:inhetited_test/features/home/domain/entity/current_weather_response_entity.dart';
import 'package:inhetited_test/features/home/domain/repository/home_repasitory.dart';

class HomeUseCase
    extends UseCase<CurrentWeatherResponseEntity, CurrentWeatherRequestEntity> {
  final HomeRepository homeRepository;

  HomeUseCase(this.homeRepository);
  @override
  Future<Either<Failure, CurrentWeatherResponseEntity>> call(
      CurrentWeatherRequestEntity params) async {
    final result = await homeRepository.getCurrentWeather(params);
    return result;
  }
}
