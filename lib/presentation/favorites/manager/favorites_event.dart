part of 'favorites_bloc.dart';

@immutable
sealed class FavoritesEvent {}

final class AddToFavorites extends FavoritesEvent {
  final ProductEntity product;

  AddToFavorites(this.product);

  List<Object> get props => [product];
}

final class RemoveFromFavorites extends FavoritesEvent {
  final ProductEntity product;

  RemoveFromFavorites(this.product);

  List<Object> get props => [product];
}

class LoadFavorites extends FavoritesEvent {}
