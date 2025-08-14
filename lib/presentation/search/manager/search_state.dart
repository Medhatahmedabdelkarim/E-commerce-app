part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchRecent extends SearchState {
  final List<String> recent;

  SearchRecent(this.recent);
}

class SearchLoaded extends SearchState {
  final List<ProductEntity> products;
  final bool submitted;
  final String query;

  SearchLoaded(this.products, this.query, {this.submitted = false});
}

class SearchLoading extends SearchState {}
class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}
