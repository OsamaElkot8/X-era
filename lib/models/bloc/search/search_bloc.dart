// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/repository/networks/api_clients/movies/movies_api_client.dart';
import 'package:xera_task/repository/networks/api_response/api_response.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MoviesApiClient moviesApiClient;
  final BuildContext context;
  late String query;
  int _page = 1;
  bool isFetching = false;

  SearchBloc(
      {required this.context,
      required this.moviesApiClient,
      SearchState? initialState})
      : super(initialState ?? SearchInitial()) {
    on<SearchMovies>((event, emit) async {
      try {
        emit(SearchLoading(
            message: AppLocalizations.of(context)!.loadingMovies));
        final ApiResponse<List<Movie>> result =
            await moviesApiClient.searchMovies(query: query, page: _page);
        emit(SearchLoaded(
            movies: result.results!,
            // ignore: use_build_context_synchronously
            message: AppLocalizations.of(context)!.noMoreMovies));
        _page++;
      } catch (e) {
        emit(SearchError(error: e.toString()));
      }
    });
  }
}
