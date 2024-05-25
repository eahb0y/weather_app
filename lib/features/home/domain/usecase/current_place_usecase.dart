import 'package:dartz/dartz.dart';
import 'package:inhetited_test/core/error/failure.dart';
import 'package:inhetited_test/core/usecase/usecase.dart';
import 'package:inhetited_test/features/home/domain/entity/current_place_request_entity.dart';
import 'package:inhetited_test/features/home/domain/entity/current_place_response_entity.dart';
import 'package:inhetited_test/features/home/domain/repository/home_repasitory.dart';

class CurrentPlaceUseCase extends UseCase<CurrentPlaceResponseEntity, CurrentPlaceRequestEntity>{
  final HomeRepository repository;

  CurrentPlaceUseCase(this.repository);
  @override
  Future<Either<Failure, CurrentPlaceResponseEntity>> call(
      CurrentPlaceRequestEntity params) async{
    final response = await repository.getCurrentPlace(params);
    return response;
  }
}