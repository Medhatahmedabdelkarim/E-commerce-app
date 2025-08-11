import '../../../services/api_services.dart';
import '../../models/product.dart';

class SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSource(this.apiService);

  Future<List<Product>> searchProducts(String query) async {
    final response = await apiService.searchProducts(query);
    return response;
  }
}
