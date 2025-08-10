import 'package:demo_app/data/models/product.dart';
import 'package:demo_app/domain/entities/product_entity.dart';
import 'package:demo_app/domain/repositories/cart_repository.dart';
import '../data_sources/local/cart_local_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveCart(List<ProductEntity> items) {
    final productModels = items.map((e) => Product.fromEntity(e)).toList();
    return localDataSource.saveCart(productModels);
  }

  @override
  Future<List<ProductEntity>> loadCart() async {
    final productModels = await localDataSource.loadCart();
    return productModels.map((p) => p.toEntity()).toList();
  }
}