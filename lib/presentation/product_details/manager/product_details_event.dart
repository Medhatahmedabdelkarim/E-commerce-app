part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent {
  const ProductDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadProductDetails extends ProductDetailsEvent {
  final int productId;

  const LoadProductDetails(this.productId);

  @override
  List<Object?> get props => [productId];
}
