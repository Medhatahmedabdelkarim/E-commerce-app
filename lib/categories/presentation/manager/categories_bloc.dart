import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product.dart';
import '../../../services/api_services.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final apiService = ApiService(
    Dio(BaseOptions(contentType: "application/json")),
  );
  int _limit = 10;
  int _offset = 0;
  bool _hasReachedEnd = false;
  List<Product> _products = [];

  CategoriesBloc() : super(CategoriesInitial()) {
    on<FetchCategoryProducts>(_onFetch);
  }

  Future<void> _onFetch(FetchCategoryProducts event, Emitter emit) async {
    if (event.isInitialLoad) {
      emit(CategoriesLoading());
      _offset = 0;
      _hasReachedEnd = false;
      _products.clear();
    } else {
      if (_hasReachedEnd || state is CategoriesLoading) return;
      _offset += _limit;
    }
      final newProducts = await apiService.getFilteredProducts(
        categoryId: event.categoryId,
        offset: _offset,
        limit: _limit,
      );

      _products.addAll(newProducts);
      _hasReachedEnd = newProducts.length < _limit;

      emit(CategoriesLoaded(products: _products, hasReachedEnd: _hasReachedEnd));

  }
}

