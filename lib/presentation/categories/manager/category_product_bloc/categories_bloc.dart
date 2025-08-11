import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/product.dart';
import '../../../../domain/UseCases/categories_use_case.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../../services/api_services.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoryProductsUseCase getCategoryProductsUseCase;

  static const int _limit = 10;

  int _offset = 0;
  bool _hasReachedEnd = false;
  List<ProductEntity> _products = [];


  CategoriesBloc({
    required this.getCategoryProductsUseCase,
  }) : super(CategoriesInitial()) {
    on<FetchCategoryProducts>(_onFetch);
  }

  Future<void> _onFetch(FetchCategoryProducts event, Emitter<CategoriesState> emit) async {
    if (event.isInitialLoad) {
      emit(CategoriesLoading());
      _offset = 0;
      _hasReachedEnd = false;
      _products.clear();
    } else {
      if (_hasReachedEnd || state is CategoriesLoading) return;
      _offset += _limit;
    }
      final newProducts = await getCategoryProductsUseCase(
        event.categoryId,
        offset: _offset,
        limit: _limit,
      );

      _products.addAll(newProducts);
      _hasReachedEnd = newProducts.length < _limit;

      emit(CategoriesLoaded(products: _products, hasReachedEnd: _hasReachedEnd));

    }
  }


