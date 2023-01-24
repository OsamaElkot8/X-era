part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Movie> movies;
  SearchLoaded({
    required this.movies,
  });
}

class SearchError extends SearchState {
  final String error;

  SearchError({
    required this.error,
  });
}
