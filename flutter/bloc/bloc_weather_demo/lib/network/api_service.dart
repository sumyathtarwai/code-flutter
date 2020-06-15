import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'modal/modals.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://www.metaweather.com/api')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    Dio dio = Dio();
    return ApiService(dio);
  }

  @GET("/location/search/")
  Future<City> getLocation(@Query('query') String keyword);

  @GET("/location/{woeid}")
  Future<WeatherReport> getWeather(@Path() int woeid);
}
