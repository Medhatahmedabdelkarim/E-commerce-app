import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product.dart';
import '../../../domain/UseCases/categories_use_case.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../services/api_services.dart';

part 'filters_event.dart';

part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  final GetCategoriesUseCase getCategories;

  FiltersBloc({required this.getCategories}) : super(FiltersInitial()) {
    on<LoadCategoriesEvent>((event, emit) async {
      emit(FiltersLoading());
        final categories = await getCategories();
        emit(CategoriesLoaded(categories));

    });
  }
}
