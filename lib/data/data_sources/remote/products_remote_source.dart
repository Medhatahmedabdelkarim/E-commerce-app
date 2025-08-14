import '../../../core/utils/api_result.dart';
import '../../../services/api_services.dart';
import '../../models/product.dart';

abstract class ProductRemoteDataSource {
  Future<ApiResult<List<Product>>> getProducts();

  Future<ApiResult<Product>> getProductById(int id);

  Future<ApiResult<List<Product>>> getFilteredProducts({
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
  Future<ApiResult<List<Product>>> getProducts() {
    return ApiResult.handleApi(() => apiService.getProduct());
  }

  @override
  Future<ApiResult<Product>> getProductById(int id) {
    return ApiResult.handleApi(() => apiService.getProductById(id));
  }

  @override
  Future<ApiResult<List<Product>>> getFilteredProducts({
    int? categoryId,
    double? minPrice,
    double? maxPrice,
    String? title,
    int offset = 0,
    int limit = 10,
  }) {
    return ApiResult.handleApi(
      () => apiService.getFilteredProducts(
        categoryId: categoryId,
        minPrice: minPrice,
        maxPrice: maxPrice,
        title: title,
      ),
    );
  }
}
