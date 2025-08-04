part of 'product_bloc.dart';

abstract class ProductEvent {}

class SortProductsEvent extends ProductEvent {
  final List<Product> products;
  final String sortFun;

  SortProductsEvent(this.products, this.sortFun);
}

class ClearProductsEvent extends ProductEvent {}

class FilterProductsEvent extends ProductEvent {
  final int? categoryId;
  final double? minPrice;
  final double? maxPrice;
  final String? title;

  FilterProductsEvent({
    this.categoryId,
    this.minPrice,
    this.maxPrice,
    this.title,
  });
}
