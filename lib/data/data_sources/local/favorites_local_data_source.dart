import '../../../constants/constants.dart';
import '../../../services/local_storage.dart';
import '../../models/product.dart';

class FavoritesLocalDataSource {
  final LocalStorageServices localStorage;

  FavoritesLocalDataSource(this.localStorage);

  Future<void> saveFavorites(List<Product> items) async {
    await localStorage.saveLocal(items,Constants.favoriteItemsKey, Constants.favoritesKey);
  }

  Future<List<Product>> loadFavorites() async {
    return await localStorage.loadLocal(Constants.favoriteItemsKey, Constants.favoritesKey);
  }
}