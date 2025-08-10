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
}
