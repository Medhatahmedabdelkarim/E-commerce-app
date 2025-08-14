import 'package:bloc/bloc.dart';
import 'package:demo_app/domain/entities/product_entity.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/resource.dart';
import '../../../data/models/product.dart';
import '../../../domain/UseCases/search_use_cases.dart';
import '../../../services/api_services.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchProductsUseCase searchProductsUseCase;
  final GetRecentSearchesUseCase getRecentSearchesUseCase;
  final AddRecentSearchUseCase addRecentSearchUseCase;
  final RemoveRecentSearchUseCase removeRecentSearchUseCase;

  SearchBloc({
    required this.searchProductsUseCase,
    required this.getRecentSearchesUseCase,
    required this.addRecentSearchUseCase,
    required this.removeRecentSearchUseCase,
  }) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<SearchSubmitted>(_onSearchSubmitted);
    on<RemoveRecentSearch>(_onRemoveRecentSearch);
  }

  Future<void> _onSearchQueryChanged(
      SearchQueryChanged event, Emitter<SearchState> emit) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(SearchRecent(getRecentSearchesUseCase()));
      return;
    }

    emit(SearchLoading());
    final result = await searchProductsUseCase(query);

    if (result is Success<List<ProductEntity>>) {
      emit(SearchLoaded(result.data, query, submitted: false));
    } else if (result is Error<List<ProductEntity>>) {
      emit(SearchError(result.message));
    }
  }

  Future<void> _onSearchSubmitted(
      SearchSubmitted event, Emitter<SearchState> emit) async {
    final query = event.query.trim();
    if (query.isEmpty) return;

    addRecentSearchUseCase(query);
    emit(SearchLoading());

    final result = await searchProductsUseCase(query);

    if (result is Success<List<ProductEntity>>) {
      emit(SearchLoaded(result.data, query, submitted: true));
    } else if (result is Error<List<ProductEntity>>) {
      emit(SearchError(result.message ));
    }
  }

  void _onRemoveRecentSearch(
      RemoveRecentSearch event, Emitter<SearchState> emit) {
    removeRecentSearchUseCase(event.query);
    emit(SearchRecent(getRecentSearchesUseCase()));
  }
}