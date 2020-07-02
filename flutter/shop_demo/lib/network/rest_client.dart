import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../provider/modal.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://shop-demo-f1.firebaseio.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/products.json")
  Future<List<ProductItem>> getProducts();

  @GET("/products/{id}.json")
  Future<ProductItem> getProductById(@Path("id") String id);

  @POST("/products.json")
  Future<ProductItem> addProduct(@Body() ProductItem product);

  @PUT("/products/{id}.json")
  Future<ProductItem> updateProduct(
      @Path() String id, @Body() ProductItem product);

  @PATCH("/products/{id}.json")
  Future<ProductItem> updateProductPart(
      @Path() String id, @Body() Map<String, dynamic> map);
}
