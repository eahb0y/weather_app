import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inhetited_test/constants/constants.dart';
import 'package:inhetited_test/features/home/domain/entity/current_weather_request_entity.dart';
import 'package:inhetited_test/features/home/domain/entity/current_weather_response_entity.dart';
import 'package:inhetited_test/features/home/domain/usecase/home_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;

  HomeBloc(this.homeUseCase)
      : super(const HomeState(
          isLoading: false,
        )) {
    on<HomeInitialCallEvent>(_getCurrentWeather);
  }

  Future<void> _getCurrentWeather(
      HomeInitialCallEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await homeUseCase.call(CurrentWeatherRequestEntity(
      key: ApiKey.key,
      lat: 69.388026,
      lon: 41.363643,
    ));
    result.fold((l) {
      emit(state.copyWith(isLoading: false));
    }, (r) {
      emit(state.copyWith(isLoading: false, weather: r));
    });
  }
}
