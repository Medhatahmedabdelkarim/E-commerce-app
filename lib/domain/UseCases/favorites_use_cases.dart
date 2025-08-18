import '../entities/product_entity.dart';
import '../repositories/favorites_repository.dart';

class AddToFavoritesUseCase {
  final FavoritesRepository repository;

  AddToFavoritesUseCase(this.repository);

  Future<List<ProductEntity>> call(List<ProductEntity> currentItems, ProductEntity product) async {
    final updatedFavorites = List<ProductEntity>.from(currentItems);
    final exists = updatedFavorites.any((p) => p.id == product.id);
    if (!exists) {
      updatedFavorites.add(product);
    }
    await repository.saveFavorites(updatedFavorites);
    return updatedFavorites;
  }
}

class RemoveFromFavoritesUseCase {
  final FavoritesRepository repository;

  RemoveFromFavoritesUseCase(this.repository);

  Future<List<ProductEntity>> call(List<ProductEntity> currentItems, ProductEntity product) async {
    final updatedFavorites = List<ProductEntity>.from(currentItems);
    updatedFavorites.removeWhere((p) => p.id == product.id);
    await repository.saveFavorites(updatedFavorites);
    return updatedFavorites;
  }
}

class LoadFavoritesUseCase {
  final FavoritesRepository repository;

  LoadFavoritesUseCase(this.repository);

  Future<List<ProductEntity>> call() async {
    return await repository.loadFavorites();
  }
}