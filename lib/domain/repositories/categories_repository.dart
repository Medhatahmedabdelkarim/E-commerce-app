import '../entities/category_entity.dart';
import '../entities/product_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();

  Future<List<ProductEntity>> getCategoryProducts(
    int categoryId, {
    int offset,
    int limit,
  });
}
