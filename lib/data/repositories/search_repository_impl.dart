import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/search_repository.dart';
import '../data_sources/remote/search_remote_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProductEntity>> searchProducts(String query) async {
    final productModels = await remoteDataSource.searchProducts(query);
    return productModels.map((model) => model.toEntity()).toList();
  }
}
