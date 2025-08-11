import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/categories_repository.dart';
import '../../services/api_services.dart';
import '../data_sources/remote/categories_remote_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final models = await remoteDataSource.getCategories();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> getCategoryProducts(
    int categoryId, {
    int offset = 0,
    int limit = 10,
  }) async {
    final models = await remoteDataSource.getCategoryProducts(
      categoryId,
      offset: offset,
      limit: limit,
    );
    return models
        .map(
          (m) => ProductEntity(
            id: m.id,
            title: m.title,
            price: m.price,
            description: m.description,
            images: m.images,
          ),
        )
        .toList();
  }
}
