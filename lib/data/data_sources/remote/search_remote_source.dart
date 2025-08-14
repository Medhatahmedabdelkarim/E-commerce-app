import '../../../core/utils/api_result.dart';
import '../../../services/api_services.dart';
import '../../models/product.dart';

class SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSource(this.apiService);

  Future<ApiResult<List<Product>>> searchProducts(String query) {
    return ApiResult.handleApi(() => apiService.searchProducts(query));
  }
}
