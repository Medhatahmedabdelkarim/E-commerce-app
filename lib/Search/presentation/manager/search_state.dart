part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchRecent extends SearchState {
  final List<String> recent;

  SearchRecent(this.recent);
}

class SearchLoaded extends SearchState {
  final List<Product> products;
  final bool submitted;

  SearchLoaded(this.products, {this.submitted = false});
}

class SearchLoading extends SearchState {}
