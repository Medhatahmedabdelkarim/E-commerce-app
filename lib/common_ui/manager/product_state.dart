part of 'product_bloc.dart';

abstract class ProductState {}

final class ProductInitial extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<ProductEntity> products;

  ProductsLoaded(this.products);
}
