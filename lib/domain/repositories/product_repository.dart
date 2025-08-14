import '../../core/utils/resource.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Resource<List<ProductEntity>>> getProducts();
  Future<Resource<ProductEntity>> getProductById(int id);
  Future<Resource<List<ProductEntity>>> getFilteredProducts({
    int? categoryId,
    double? minPrice,
    double? maxPrice,
    String? title,
  });
}
