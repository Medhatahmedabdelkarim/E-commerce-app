part of 'categories_list_bloc.dart';

@immutable
abstract class CategoriesListState {}

class CategoriesListInitial extends CategoriesListState {}

class CategoriesListLoading extends CategoriesListState {}

class CategoriesListLoaded extends CategoriesListState {
  final List<CategoryEntity> categories;
  CategoriesListLoaded({required this.categories});
}
