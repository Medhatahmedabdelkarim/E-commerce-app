import '../../core/utils/resource.dart';
import '../entities/category_entity.dart';
import '../entities/product_entity.dart';
import '../repositories/categories_repository.dart';


class GetCategoriesUseCase {
  final CategoryRepository repository;
  GetCategoriesUseCase(this.repository);

  Future<Resource<List<CategoryEntity>>> call() => repository.getCategories();
}

class GetCategoryProductsUseCase {
  final CategoryRepository repository;
  GetCategoryProductsUseCase(this.repository);

  Future<Resource<List<ProductEntity>>> call(
      int categoryId, {
        int offset = 0,
        int limit = 10,
      }) {
    return repository.getCategoryProducts(categoryId, offset: offset, limit: limit);
  }
}
