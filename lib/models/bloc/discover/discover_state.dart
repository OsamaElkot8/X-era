part of 'discover_bloc.dart';

@immutable
abstract class DiscoverState {}

class DiscoverInitial extends DiscoverState {}

class DiscoverLoading extends DiscoverState {
  final String message;

  DiscoverLoading({
    required this.message,
  });
}

class DiscoverLoaded extends DiscoverState {
  final List<Movie> movies;
  final String message;
  DiscoverLoaded({
    required this.movies,
    required this.message,
  });
}

class DiscoverError extends DiscoverState {
  final String error;

  DiscoverError({
    required this.error,
  });
}
