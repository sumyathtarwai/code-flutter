import 'package:api_demo/data/model/photo.dart';
import 'package:api_demo/data/model/post.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient create() {
    final dio = Dio();
   // dio.interceptors.add(PrettyDioLogger());
    return RestClient(dio);
  }

  @GET("/posts")
  Future<List<Post>> getPosts();

  @GET("/photos")
  Future<List<Photo>> getPhotos();

  @GET("/posts/{id}")
  Future<Post> getPost(@Path("id") String id);
}
