import '../entities/product_entity.dart';
import '../repositories/search_repository.dart';

class SearchProductsUseCase {
  final SearchRepository repository;

  SearchProductsUseCase(this.repository);

  Future<List<ProductEntity>> call(String query) async {
    return await repository.searchProducts(query);
  }
}

class GetRecentSearchesUseCase {
  final List<String> _recentSearches;

  GetRecentSearchesUseCase(this._recentSearches);

  List<String> call() {
    return _recentSearches;
  }
}

class AddRecentSearchUseCase {
  final List<String> _recentSearches;

  AddRecentSearchUseCase(this._recentSearches);

  void call(String query) {
    if (!_recentSearches.contains(query)) {
      if (_recentSearches.length == 4) {
        _recentSearches.removeLast();
      }
      _recentSearches.insert(0, query);
    }
  }
}

class RemoveRecentSearchUseCase {
  final List<String> _recentSearches;

  RemoveRecentSearchUseCase(this._recentSearches);

  void call(String query) {
    _recentSearches.remove(query);
  }
}