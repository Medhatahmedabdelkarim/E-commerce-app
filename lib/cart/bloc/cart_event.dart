part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class AddToCart extends CartEvent{
final Product product;
AddToCart(this.product);

List<Object> get props=>[product];

}
final class RemoveFromCart extends CartEvent{
  final Product product;
  RemoveFromCart(this.product);

  List<Object> get props=>[product];

}


