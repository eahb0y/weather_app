part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final CurrentWeatherResponseEntity? weather;

  const HomeState({
    required this.isLoading,
    this.weather,
  });

  HomeState copyWith({
    bool isLoading = false,
    CurrentWeatherResponseEntity? weather,
  }) {
    return HomeState(
      isLoading: isLoading,
      weather: weather ?? this.weather,
    );
  }

  @override
  List<Object?> get props => [isLoading, weather];
}
