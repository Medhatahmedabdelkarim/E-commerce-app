import '../../core/utils/resource.dart';
import '../entities/product_entity.dart';

abstract class SearchRepository {
  Future<Resource<List<ProductEntity>>> searchProducts(String query);
}