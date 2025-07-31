part of 'filters_bloc.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  final List<Product> filteredProducts;

  FilterLoaded(this.filteredProducts);
}