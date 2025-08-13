import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../domain/UseCases/categories_use_case.dart';
import '../../../../domain/entities/category_entity.dart';
import '../../../../core/utils/resource.dart';

part 'categories_list_event.dart';
part 'categories_list_state.dart';

class CategoriesListBloc extends Bloc<CategoriesListEvent, CategoriesListState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesListBloc({required this.getCategoriesUseCase}) : super(CategoriesListInitial()) {
    on<LoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(LoadCategories event, Emitter<CategoriesListState> emit) async {
    emit(CategoriesListLoading());

    final result = await getCategoriesUseCase();

    if (result is Success<List<CategoryEntity>>) {
      emit(CategoriesListLoaded(categories: result.data));
    } else if (result is Error<List<CategoryEntity>>) {
      emit(CategoriesListError(result.message));
    }
  }
}
