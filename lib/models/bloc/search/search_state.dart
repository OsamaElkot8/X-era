part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {
  final String message;

  SearchLoading({
    required this.message,
  });
}

class SearchLoaded extends SearchState {
  final List<Movie> movies;
  final String message;
  SearchLoaded({
    required this.movies,
    required this.message,
  });
}

class SearchError extends SearchState {
  final String error;

  SearchError({
    required this.error,
  });
}
