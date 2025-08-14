import '../../core/utils/api_result.dart';
import '../../core/utils/resource.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/remote/products_remote_source.dart';
import '../models/product.dart';

import '../../core/utils/api_result.dart';
import '../../core/utils/resource.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/remote/products_remote_source.dart';
import '../models/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Resource<List<ProductEntity>>> getProducts() async {
    final result = await remoteDataSource.getProducts();

    if (result is ApiSuccess<List<Product>>) {
      return Success(result.data.map((p) => p.toEntity()).toList());
    } else if (result is ApiError<List<Product>>) {
      return Error(result.message);
    }

    return const Error("Unknown error occurred");
  }

  @override
  Future<Resource<ProductEntity>> getProductById(int id) async {
    final result = await remoteDataSource.getProductById(id);

    if (result is ApiSuccess<Product>) {
      return Success(result.data.toEntity());
    } else if (result is ApiError<Product>) {
      return Error(result.message);
    }

    return const Error("Unknown error occurred");
  }

  @override
  Future<Resource<List<ProductEntity>>> getFilteredProducts({
    int? categoryId,
    double? minPrice,
    double? maxPrice,
    String? title,
  }) async {
    final result = await remoteDataSource.getFilteredProducts(
      categoryId: categoryId,
      minPrice: minPrice,
      maxPrice: maxPrice,
      title: title,
    );

    if (result is ApiSuccess<List<Product>>) {
      return Success(result.data.map((p) => p.toEntity()).toList());
    } else if (result is ApiError<List<Product>>) {
      return Error(result.message);
    }

    return const Error("Unknown error occurred");
  }
}

