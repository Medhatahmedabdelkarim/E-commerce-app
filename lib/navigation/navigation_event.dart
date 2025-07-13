part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {
  get tabIndex => null;
}

final class OnChangeNav extends NavigationEvent{
  final tabIndex;
  OnChangeNav({required this.tabIndex});
}
