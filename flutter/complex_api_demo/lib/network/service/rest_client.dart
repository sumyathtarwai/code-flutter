import 'package:complex_api_demo/data/post.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://thiha.tech/bp7y5yx5gamxdqttgyc/wp/v2/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient create() {
    final dio = Dio();
    // dio.interceptors.add(PrettyDioLogger());
    return RestClient(dio);
  }

  @GET("/posts")
  Future<List<Post>> getPosts(@Queries() Map<String, dynamic> map);

  @GET("/posts/{id}")
  Future<Post> getPost(@Path("id") String id);
}
