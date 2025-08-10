import '../../constants/constants.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../../services/local_storage.dart';
import '../data_sources/local/favorites_local_data_source.dart';
import '../models/product.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource localDataSource;

  FavoritesRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveFavorites(List<ProductEntity> items) {
    final productModels = items.map((e) => Product.fromEntity(e)).toList();
    return localDataSource.saveFavorites(productModels);
  }

  @override
  Future<List<ProductEntity>> loadFavorites() async {
    final productModels = await localDataSource.loadFavorites();
    return productModels.map((p) => p.toEntity()).toList();
  }
}