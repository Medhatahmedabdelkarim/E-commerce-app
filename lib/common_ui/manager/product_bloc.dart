import 'package:bloc/bloc.dart';
import 'package:demo_app/common_ui/manager/func/sort_helper.dart';
import 'package:demo_app/domain/entities/product_entity.dart';
import 'package:demo_app/services/api_services.dart';
import 'package:dio/dio.dart';
import '../../core/utils/resource.dart';
import '../../data/models/product.dart';
import '../../domain/UseCases/products_use_case.dart';

part 'product_event.dart';

part 'product_state.dart';




class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetFilteredProducts getFilteredProducts;
  final SortProducts sortProducts;

  ProductBloc({
    required this.getFilteredProducts,
    required this.sortProducts,
  }) : super(ProductInitial()) {
    on<SortProductsEvent>((event, emit) {
      final sorted = sortProducts(event.sortFun, event.products);
      emit(ProductsLoaded(sorted));
    });

    on<ClearProductsEvent>((event, emit) {
      emit(ProductInitial());
    });

    on<FilterProductsEvent>((event, emit) async {

      final result = await getFilteredProducts(
        categoryId: event.categoryId,
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
        title: event.title,
      );

      if (result is Success<List<ProductEntity>>) {
        emit(ProductsLoaded(result.data));
      } else if (result is Error<List<ProductEntity>>) {
        emit(ProductsError(result.message));
      } else {
        emit(ProductsError("Unknown error occurred"));
      }
    });
  }
}

