import 'package:bloc/bloc.dart';
import 'package:demo_app/common_ui/manager/func/sort_helper.dart';
import 'package:demo_app/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../data/models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final apiService = ApiService(
    Dio(BaseOptions(contentType: "application/json")),
  );  ProductBloc() : super(ProductInitial()) {
  on<SortProductsEvent>((event, emit){
      final products=SortHelper.sortProducts(event.sortFun,event.products);
      emit(ProductsLoaded(products));
    }
  );
  on<ClearProductsEvent>((event, emit){
    emit(ProductInitial());
  }
  );
  on<FilterProductsEvent>((event, emit) async {
      final products = await apiService.getFilteredProducts(
        categoryId: event.categoryId,
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
        title: event.title
      );
      emit(ProductsLoaded(products));

    }
  );


    }

}


