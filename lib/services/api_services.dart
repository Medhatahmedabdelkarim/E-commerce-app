import 'package:demo_app/data/models/product.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../data/models/category.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://api.escuelajs.co/api/v1/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('products')
  Future<List<Product>> getProduct();

  @GET('categories')
  Future<List<Category>> getCategory();

  @GET('products/{id}')
  Future<Product> getProductById(@Path("id") int id);

  @GET('categories/{id}')
  Future<Category> getCategoryById(@Path("id") int id);

  @GET('categories/{id}/products')
  Future<List<Product>> getCategoryProducts(@Path("id") int id);

  @GET("products/")
  Future<List<Product>> searchProducts(@Query("title") String title);

  @GET('products')
  Future<List<Product>> getFilteredProducts({
    @Query("categoryId") int? categoryId,
    @Query("title") String? title,
    @Query("price_min") double? minPrice,
    @Query("price_max") double? maxPrice,
  });
}
