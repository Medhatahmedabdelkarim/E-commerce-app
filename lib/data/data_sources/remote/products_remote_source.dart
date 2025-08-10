import '../../../services/api_services.dart';
import '../../models/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(int id);

}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiService apiService;
  ProductRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Product>> getProducts() {
    return apiService.getProduct();
  }
  @override
  Future<Product> getProductById(int id) {
    return apiService.getProductById(id);
  }
}