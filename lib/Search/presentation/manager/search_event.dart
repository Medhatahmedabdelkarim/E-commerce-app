part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchQueryChanged extends SearchEvent {
  final String query;

  SearchQueryChanged(this.query);
}

class SearchSubmitted extends SearchEvent {
  final String query;

  SearchSubmitted(this.query);
}

class RemoveRecentSearch extends SearchEvent {
  final String query;

  RemoveRecentSearch(this.query);
}
