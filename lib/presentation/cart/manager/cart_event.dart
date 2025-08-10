part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class AddToCart extends CartEvent {
  final ProductEntity product;

  AddToCart(this.product);

  List<Object> get props => [product];
}

final class RemoveFromCart extends CartEvent {
  final ProductEntity product;

  RemoveFromCart(this.product);

  List<Object> get props => [product];
}

final class DeleteSpecificProduct extends CartEvent {
  final ProductEntity product;

  DeleteSpecificProduct(this.product);

  List<Object> get props => [product];
}

final class ClearCart extends CartEvent {}
