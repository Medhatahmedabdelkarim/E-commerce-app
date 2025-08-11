import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/UseCases/categories_use_case.dart';
import '../../../../domain/entities/category_entity.dart';
import '../category_product_bloc/categories_bloc.dart';

part 'categories_list_event.dart';
part 'categories_list_state.dart';

class CategoriesListBloc extends Bloc<CategoriesListEvent, CategoriesListState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesListBloc({required this.getCategoriesUseCase}) : super(CategoriesListInitial()) {
    on<LoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(LoadCategories event, Emitter<CategoriesListState> emit) async {
    emit(CategoriesListLoading());
      final categories = await getCategoriesUseCase();
      emit(CategoriesListLoaded(categories: categories));

  }
}
