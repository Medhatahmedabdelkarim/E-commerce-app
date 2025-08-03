import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product.dart';
import '../../../services/api_services.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final apiService = ApiService(
    Dio(BaseOptions(contentType: "application/json")),
  );
  final List<String> recentSearches = [];

  SearchBloc() : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<SearchSubmitted>(_onSearchSubmitted);
    on<RemoveRecentSearch>(_onRemoveRecentSearch);
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(SearchRecent(List.from(recentSearches)));
      return;
    }

    emit(SearchLoading());
    final products = await apiService.searchProducts(query);
    emit(SearchLoaded(products, query,submitted: false));
  }

  Future<void> _onSearchSubmitted(
    SearchSubmitted event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query.trim();
    if (query.isEmpty) return;

    if (!recentSearches.contains(query)) {
      if (recentSearches.length == 4) recentSearches.removeLast();
      recentSearches.insert(0, query);
    }

    emit(SearchLoading());
    final products = await apiService.searchProducts(query);
    emit(SearchLoaded(products,query, submitted: true));
  }

  void _onRemoveRecentSearch(
    RemoveRecentSearch event,
    Emitter<SearchState> emit,
  ) {
    recentSearches.remove(event.query);
    emit(SearchRecent(List.from(recentSearches)));
  }
}
