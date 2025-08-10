import '../entities/product_entity.dart';

abstract class FavoritesRepository {
  Future<void> saveFavorites(List<ProductEntity> items);
  Future<List<ProductEntity>> loadFavorites();
}