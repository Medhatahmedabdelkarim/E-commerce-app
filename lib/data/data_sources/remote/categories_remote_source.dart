import '../../../services/api_services.dart';
import '../../models/category.dart';
import '../../models/product.dart';

abstract class CategoryRemoteDataSource {
  Future<List<Category>> getCategories();

  Future<List<Product>> getCategoryProducts(
    int categoryId, {
    int offset,
    int limit,
  });
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiService apiService;

  CategoryRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Category>> getCategories() {
    return apiService.getCategory();
  }

  @override
  Future<List<Product>> getCategoryProducts(
    int categoryId, {
    int offset = 0,
    int limit = 10,
  }) {
    return apiService.getFilteredProducts(
      categoryId: categoryId,
      offset: offset,
      limit: limit,
    );
  }
}
