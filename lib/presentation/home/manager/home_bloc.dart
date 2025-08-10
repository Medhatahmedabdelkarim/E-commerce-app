import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/UseCases/products_use_case.dart';
import '../../../domain/entities/product_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductsUseCase getProducts;

  HomeBloc(this.getProducts) : super(HomeLoading()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final products = await getProducts();
        emit(HomeLoaded(products));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
