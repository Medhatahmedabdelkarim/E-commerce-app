import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/UseCases/products_use_case.dart';
import '../../../domain/entities/product_entity.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductByIdUseCase getProductById;

  ProductDetailsBloc(this.getProductById) : super(ProductDetailsInitial()) {
    on<LoadProductDetails>((event, emit) async {
      emit(ProductDetailsLoading());
      try {
        final product = await getProductById(event.productId);
        emit(ProductDetailsLoaded(product));
      } catch (e) {
        emit(ProductDetailsError(e.toString()));
      }
    });
  }
}