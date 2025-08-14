import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/resource.dart';
import '../../../domain/UseCases/products_use_case.dart';
import '../../../domain/entities/product_entity.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductByIdUseCase getProductById;

  ProductDetailsBloc(this.getProductById) : super(ProductDetailsInitial()) {
    on<LoadProductDetails>((event, emit) async {
      emit(ProductDetailsLoading());

      final result = await getProductById(event.productId);

      if (result is Success<ProductEntity>) {
        emit(ProductDetailsLoaded(result.data));
      } else if (result is Error<ProductEntity>) {
        emit(ProductDetailsError(result.message));
      } else {
        emit(const ProductDetailsError("Unknown error occurred"));
      }
    });
  }
}