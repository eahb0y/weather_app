import 'package:dio/dio.dart';
import 'package:inhetited_test/constants/constants.dart';
import 'package:inhetited_test/features/home/data/modal/get_current_weather_modal.dart';
import 'package:retrofit/retrofit.dart';

part 'home_remote_data_source.g.dart';

@RestApi(baseUrl: BaseUrl.baseUrl)
abstract class HomeRemoteDataSource {
  factory HomeRemoteDataSource(Dio dio, {String baseUrl}) =
      _HomeRemoteDataSource;

  @GET("weather")
  Future<GetCurrentWeatherModal> getCurrentWeather(
    @Query("lat") double lat,
    @Query("lon") double lon,
    @Query("appid") String apiKey,
  );
}
