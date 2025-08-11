part of 'filters_bloc.dart';

@immutable
abstract class FilterEvent {}

abstract class FiltersEvent {}

class LoadCategoriesEvent extends FiltersEvent {}