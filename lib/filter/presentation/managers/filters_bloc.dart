import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product.dart';
import '../../../services/api_services.dart';

part 'filters_event.dart';

part 'filters_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final apiService = ApiService(
    Dio(BaseOptions(contentType: "application/json")),
  );

  FilterBloc() : super(FilterInitial()) {
    on<ApplyFilters>((event, emit) async {
      emit(FilterLoading());
      final products = await apiService.getFilteredProducts(
        categoryId: event.categoryId,
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
      );
      emit(FilterLoaded(products));
    });
  }
}
