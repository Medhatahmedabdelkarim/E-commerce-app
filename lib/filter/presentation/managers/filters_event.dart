part of 'filters_bloc.dart';

@immutable
abstract class FilterEvent {}

class ApplyFilters extends FilterEvent {
  final int? categoryId;
  final double? minPrice;
  final double? maxPrice;
  final String? title;

  ApplyFilters({this.categoryId, this.minPrice, this.maxPrice, this.title});
}
