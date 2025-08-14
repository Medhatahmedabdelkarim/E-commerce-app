import '../../core/utils/api_result.dart';
import '../../core/utils/resource.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/search_repository.dart';
import '../data_sources/remote/search_remote_source.dart';
import '../models/product.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl(this.remoteDataSource);

  @override
  Future<Resource<List<ProductEntity>>> searchProducts(String query) async {
    final result = await remoteDataSource.searchProducts(query);

    if (result is ApiSuccess<List<Product>>) {
      return Success(result.data.map((p) => p.toEntity()).toList());
    } else if (result is ApiError<List<Product>>) {
      return Error(result.message);
    }

    return const Error("Unknown error occurred");
  }
}
