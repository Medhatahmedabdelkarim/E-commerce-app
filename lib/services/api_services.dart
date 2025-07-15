
import 'package:demo_app/data/models/product.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';
@RestApi(baseUrl: 'https://api.escuelajs.co/api/v1/')
 abstract class ApiService{
     factory ApiService(Dio dio)=_ApiService;
     @GET('products')
     Future<List<Product>> getProduct();

}