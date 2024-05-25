import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inhetited_test/constants/constants.dart';
import 'package:inhetited_test/features/home/domain/entity/current_place_request_entity.dart';
import 'package:inhetited_test/features/home/domain/entity/current_place_response_entity.dart';
import 'package:inhetited_test/features/home/domain/entity/current_weather_request_entity.dart';
import 'package:inhetited_test/features/home/domain/entity/current_weather_response_entity.dart';
import 'package:inhetited_test/features/home/domain/usecase/current_place_usecase.dart';
import 'package:inhetited_test/features/home/domain/usecase/current_weather_usecase.dart';
import 'package:inhetited_test/geolocation_servise.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;
  final CurrentPlaceUseCase placeUseCase;

  HomeBloc(
    this.homeUseCase,
    this.placeUseCase,
  ) : super(const HomeState(
          isLoading: false,
        )) {
    on<HomeInitialCallEvent>(_initialCall);
  }

  Future<void> _initialCall(
      HomeInitialCallEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    Position position = await GeolocationService.determinePosition();
    Future.wait([
      _getCurrentWeather(position, emit),
      _getCurrentPlace(position, emit),
    ]);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _getCurrentWeather(
      Position position, Emitter<HomeState> emit) async {
    final result = await homeUseCase.call(CurrentWeatherRequestEntity(
      key: ApiKey.key,
      lat: position.latitude,
      lon: position.longitude,
    ));
    result.fold((l) {}, (r) {
      emit(state.copyWith(weather: r));
    });
  }

  Future<void> _getCurrentPlace(
      Position position, Emitter<HomeState> emit) async {
    final result = await placeUseCase.call(
      CurrentPlaceRequestEntity(
        lon: position.longitude,
        lat: position.latitude,
        key: ApiKey.key,
        limit: 1,
      ),
    );
    result.fold((l) {}, (r) {
      emit(state.copyWith(place: r));
    });
  }
}
