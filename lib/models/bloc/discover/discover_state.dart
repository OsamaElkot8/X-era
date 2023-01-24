part of 'discover_bloc.dart';

@immutable
abstract class DiscoverState {}

class DiscoverInitial extends DiscoverState {}

class DiscoverLoading extends DiscoverState {}

class DiscoverLoaded extends DiscoverState {
  final List<Movie> movies;
  DiscoverLoaded({
    required this.movies,
  });
}

class DiscoverError extends DiscoverState {
  final String error;

  DiscoverError({
    required this.error,
  });
}
