import '../../core/utils/resource.dart';
import '../entities/product_entity.dart';
import '../repositories/search_repository.dart';

class SearchProductsUseCase {
  final SearchRepository repository;

  SearchProductsUseCase(this.repository);

  Future<Resource<List<ProductEntity>>> call(String query) {
    return repository.searchProducts(query);
  }
}

class GetRecentSearchesUseCase {
  final List<String> _recentSearches;

  GetRecentSearchesUseCase(this._recentSearches);

  List<String> call() => _recentSearches;
}

class AddRecentSearchUseCase {
  final List<String> _recentSearches;

  AddRecentSearchUseCase(this._recentSearches);

  void call(String query) {
    if (query.trim().isEmpty) return;

    _recentSearches.remove(query); // Move to top if exists
    _recentSearches.insert(0, query);

    if (_recentSearches.length > 4) {
      _recentSearches.removeLast();
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