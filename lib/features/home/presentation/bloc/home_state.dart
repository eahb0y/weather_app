part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final CurrentWeatherResponseEntity? weather;
  final CurrentPlaceResponseEntity? place;

  const HomeState({
    required this.isLoading,
    this.weather,
    this.place,
  });

  HomeState copyWith({
    bool isLoading = false,
    CurrentWeatherResponseEntity? weather,
    CurrentPlaceResponseEntity? place,
  }) {
    return HomeState(
      isLoading: isLoading,
      weather: weather ?? this.weather,
      place: place ?? this.place,
    );
  }

  @override
  List<Object?> get props => [isLoading, weather, place];
}
