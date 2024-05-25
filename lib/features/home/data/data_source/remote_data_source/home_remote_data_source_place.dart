import 'package:dio/dio.dart';
import 'package:inhetited_test/constants/constants.dart';
import 'package:inhetited_test/features/home/data/modal/get_current_place_modal.dart';
import 'package:retrofit/http.dart';

part 'home_remote_data_source_place.g.dart';

@RestApi(baseUrl: BaseUrl.currentPlaceUrl)
abstract class HomeRemoteDataSourcePlace {
  factory HomeRemoteDataSourcePlace(Dio dio, {String baseUrl}) =
  _HomeRemoteDataSourcePlace;

  @GET("reverse")
  Future<GetCurrentPlaceModal> getCurrentPlace(
      @Query("lat") double lat,
      @Query("lon") double lon,
      @Query("appid") String apiKey,
      @Query("limit") int limit,
      );
}