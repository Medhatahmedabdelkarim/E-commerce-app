part of 'home_bloc.dart';

abstract class HomeState{
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ProductEntity> products;

  const HomeLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}