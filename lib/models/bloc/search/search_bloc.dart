// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/repository/networks/api_clients/movies/movies_api_client.dart';
import 'package:xera_task/repository/networks/api_response/api_response.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MoviesApiClient moviesApiClient;
  late String query;
  int page = 1;
  bool isFetching = false;

  SearchBloc({required this.moviesApiClient, SearchState? initialState})
      : super(initialState ?? SearchInitial()) {
    on<SearchMovies>((event, emit) async {
      try {
        emit(SearchLoading());
        final ApiResponse<List<Movie>> result =
            await moviesApiClient.searchMovies(query: query, page: page);
        emit(SearchLoaded(movies: result.results!));
        page++;
      } catch (e) {
        emit(SearchError(error: e.toString()));
      }
    });
  }
}
