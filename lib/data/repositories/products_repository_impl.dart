import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/remote/products_remote_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    final products = await remoteDataSource.getProducts();
    return products.map((p) => p.toEntity()).toList();
  }

  @override
  Future<ProductEntity> getProductById(int id) async {
    final model = await remoteDataSource.getProductById(id);
    return model.toEntity();
  }

  @override
  Future<List<ProductEntity>> getFilteredProducts({
    int? categoryId,
    double? minPrice,
    double? maxPrice,
    String? title,
  }) async {
    final products = await remoteDataSource.getFilteredProducts(
      categoryId: categoryId,
      minPrice: minPrice,
      maxPrice: maxPrice,
      title: title,
    );
    return products.map((p) => p.toEntity()).toList();
  }
}
