part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {
  final int tabIndex;

  NavigationState({required this.tabIndex});
}

final class NavigationInitial extends NavigationState {
  NavigationInitial({required super.tabIndex});
}
