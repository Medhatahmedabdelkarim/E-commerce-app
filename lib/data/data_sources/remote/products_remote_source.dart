import '../../../services/api_services.dart';
import '../../models/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getProducts();

  Future<Product> getProductById(int id);

  Future<List<Product>> getFilteredProducts({
    int? categoryId,
    double? minPrice,
    double? maxPrice,
    String? title,
  });
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

  @override
  Future<List<Product>> getFilteredProducts({
    int? categoryId,
    double? minPrice,
    double? maxPrice,
    String? title,
  }) {
    return apiService.getFilteredProducts(
      categoryId: categoryId,
      minPrice: minPrice,
      maxPrice: maxPrice,
      title: title,
    );
  }
}
