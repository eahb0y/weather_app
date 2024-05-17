class CurrentWeatherResponseEntity {
  final List<WeatherEntity>? weather;
  final double? weatherMain;

  CurrentWeatherResponseEntity({
    required this.weather,
    required this.weatherMain,
  });
}

// class WeatherMain {
//   final double? temp;
//
//   WeatherMain({required this.temp});
// }

class WeatherEntity {
  final String? main;
  final String? description;

  WeatherEntity({
    required this.main,
    required this.description,
  });
}
