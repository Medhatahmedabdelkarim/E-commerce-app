import '../../../core/utils/api_result.dart';
import '../../../services/api_services.dart';
import '../../models/category.dart';
import '../../models/product.dart';
import 'package:dio/dio.dart';
abstract class CategoryRemoteDataSource {
  Future<ApiResult<List<Category>>> getCategories();

  Future<ApiResult<List<Product>>> getCategoryProducts(
      int categoryId, {
        int offset,
        int limit,
      });
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final ApiService apiService;

  CategoryRemoteDataSourceImpl(this.apiService);

  @override
  Future<ApiResult<List<Category>>> getCategories() {
    return ApiResult.handleApi(() => apiService.getCategory());
  }

  @override
  Future<ApiResult<List<Product>>> getCategoryProducts(
      int categoryId, {
        int offset = 0,
        int limit = 10,
      }) {
    return ApiResult.handleApi(
          () => apiService.getFilteredProducts(
        categoryId: categoryId,
        offset: offset,
        limit: limit,
      ),
    );
  }
}
