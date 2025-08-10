part of 'categories_bloc.dart';

@immutable
sealed class CategoriesEvent {}


class FetchCategoryProducts extends CategoriesEvent {
  final int categoryId;
  final bool isInitialLoad;

  FetchCategoryProducts(this.categoryId, {this.isInitialLoad = false});
}