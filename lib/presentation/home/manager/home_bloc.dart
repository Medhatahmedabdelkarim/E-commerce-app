import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/resource.dart';
import '../../../domain/UseCases/products_use_case.dart';
import '../../../domain/entities/product_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductsUseCase getProducts;

  HomeBloc(this.getProducts) : super(HomeLoading()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(HomeLoading());

      final result = await getProducts();

      if (result is Success<List<ProductEntity>>) {
        emit(HomeLoaded(result.data));
      } else if (result is Error<List<ProductEntity>>) {
        emit(HomeError(result.message));
      } else {
        emit(const HomeError("Unknown error occurred"));
      }
    });
  }
}
