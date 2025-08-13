part of 'filters_bloc.dart';

abstract class FiltersState {}

class FiltersInitial extends FiltersState {}

class FiltersLoading extends FiltersState {}

class CategoriesLoaded extends FiltersState {
  final List<CategoryEntity> categories;
  CategoriesLoaded(this.categories);
}
class FiltersError extends FiltersState {
  final String message;
  FiltersError(this.message);
}