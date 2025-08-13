import '../../core/utils/api_result.dart';
import '../../core/utils/resource.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/categories_repository.dart';
import '../data_sources/remote/categories_remote_source.dart';
import '../models/category.dart';
import '../models/product.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Resource<List<CategoryEntity>>> getCategories() async {
    final result = await remoteDataSource.getCategories();

    if (result is ApiSuccess<List<Category>>) {
      final entities = result.data.map((model) => model.toEntity()).toList();
      return Success<List<CategoryEntity>>(entities);
    } else if (result is ApiError<List<Category>>) {
      return Error<List<CategoryEntity>>(result.message);
    }
    return Error<List<CategoryEntity>>("Unknown error");
  }

  @override
  Future<Resource<List<ProductEntity>>> getCategoryProducts(
      int categoryId, {
        int offset = 0,
        int limit = 10,
      }) async {
    final result = await remoteDataSource.getCategoryProducts(
      categoryId,
      offset: offset,
      limit: limit,
    );

    if (result is ApiSuccess<List<Product>>) {
      final entities = result.data.map((m) {
        return ProductEntity(
          id: m.id,
          title: m.title,
          price: m.price,
          description: m.description,
          images: m.images,
        );
      }).toList();
      return Success<List<ProductEntity>>(entities);
    } else if (result is ApiError<List<Product>>) {
      return Error<List<ProductEntity>>(result.message);
    }
    return Error<List<ProductEntity>>("Unknown error");
  }
}
