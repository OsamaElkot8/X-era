// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/repository/networks/api_clients/movies/movies_api_client.dart';
import 'package:xera_task/repository/networks/api_response/api_response.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final MoviesApiClient moviesApiClient;
  int _page = 1;
  bool isFetching = false;

  DiscoverBloc({required this.moviesApiClient, DiscoverState? initialState})
      : super(initialState ?? DiscoverInitial()) {
    on<DiscoverMovies>((event, emit) async {
      try {
        emit(DiscoverLoading());
        final ApiResponse<List<Movie>> result =
            await moviesApiClient.discoverMovies(page: _page);
        emit(DiscoverLoaded(movies: result.results!));
        _page++;
      } catch (e) {
        emit(DiscoverError(error: e.toString()));
      }
    });
  }
}
