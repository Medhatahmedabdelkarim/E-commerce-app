import '../../common_ui/manager/func/sort_helper.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

import '../../core/utils/resource.dart';


class GetProductsUseCase {
  final ProductRepository repository;
  GetProductsUseCase(this.repository);

  Future<Resource<List<ProductEntity>>> call() {
    return repository.getProducts();
  }
}

class GetProductByIdUseCase {
  final ProductRepository repository;

  GetProductByIdUseCase(this.repository);

  Future<Resource<ProductEntity>> call(int id) {
    return repository.getProductById(id);
  }
}

class GetFilteredProducts {
  final ProductRepository repository;

  GetFilteredProducts(this.repository);

  Future<Resource<List<ProductEntity>>> call({
    int? categoryId,
    double? minPrice,
    double? maxPrice,
    String? title,
  }) {
    return repository.getFilteredProducts(
      categoryId: categoryId,
      minPrice: minPrice,
      maxPrice: maxPrice,
      title: title,
    );
  }
}

class SortProducts {
  List<ProductEntity> call(String sortFun, List<ProductEntity> products) {
    return SortHelper.sortProducts(sortFun, products);
  }
}
