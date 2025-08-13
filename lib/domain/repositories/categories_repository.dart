import '../entities/category_entity.dart';
import '../entities/product_entity.dart';
import '../../../core/utils/resource.dart';

abstract class CategoryRepository {
  Future<Resource<List<CategoryEntity>>> getCategories();

  Future<Resource<List<ProductEntity>>> getCategoryProducts(
      int categoryId, {
        int offset,
        int limit,
      });
}
