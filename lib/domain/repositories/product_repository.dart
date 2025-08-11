import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
  Future<ProductEntity> getProductById(int id);
  Future<List<ProductEntity>> getFilteredProducts({
    int? categoryId,
    double? minPrice,
    double? maxPrice,
    String? title,
  });
}
