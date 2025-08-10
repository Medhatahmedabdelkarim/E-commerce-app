import 'package:demo_app/data/models/product.dart';

import '../entities/product_entity.dart';

abstract class CartRepository {
  Future<void> saveCart(List<ProductEntity> items);
  Future<List<ProductEntity>> loadCart();
}