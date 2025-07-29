part of 'product_bloc.dart';

abstract class ProductEvent {}

class SortProductsEvent extends ProductEvent {
  final List<Product> products;
  final String sortFun;
  SortProductsEvent(this.products, this.sortFun);
}
class ClearProductsEvent extends ProductEvent{
}
