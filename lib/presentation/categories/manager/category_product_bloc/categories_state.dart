part of 'categories_bloc.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}


class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<ProductEntity> products;
  final bool hasReachedEnd;

  CategoriesLoaded({required this.products, required this.hasReachedEnd});
}