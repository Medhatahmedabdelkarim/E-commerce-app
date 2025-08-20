import 'package:demo_app/data/models/product.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../core/utils/token_storage.dart';
import '../data/models/category.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://ecommerce-app-production-e80c.up.railway.app/')
abstract class ApiService {
  factory ApiService(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = TokenStorage.token;
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
    return _ApiService(dio);
  }

  @POST('api/v1/auth/login')
  Future<Map<String, dynamic>> login(@Body() Map<String, dynamic> body);

  @GET('products')
  Future<List<Product>> getProduct();

  @GET('categories/category')
  Future<List<Category>> getCategory();

  @GET('products/{id}')
  Future<Product> getProductById(@Path("id") int id);

  @GET('categories/{id}')
  Future<Category> getCategoryById(@Path("id") int id);

  @GET('categories/{id}/products')
  Future<List<Product>> getCategoryProducts(@Path("id") int id);

  @GET("products/search")
  Future<List<Product>> searchProducts(@Query("query") String title);

  @GET('products/filter')
  Future<List<Product>> getFilteredProducts({
    @Query("categoryId") int? categoryId,
    @Query("title") String? title,
    @Query("price_min") double? minPrice,
    @Query("price_max") double? maxPrice,
    @Query("offset") int offset = 0,
    @Query("limit") int limit = 10,
  });
}
