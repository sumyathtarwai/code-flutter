import 'package:dio/dio.dart';
//import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../network/modal/track.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
  //  dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @GET('/photos')
  Future<List<Track>> getPhotos();
}
