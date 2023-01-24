// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/repository/networks/api_clients/movies/movies_api_client.dart';
import 'package:xera_task/repository/networks/api_response/api_response.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final MoviesApiClient moviesApiClient;
  final BuildContext context;
  int _page = 1;
  bool isFetching = false;

  DiscoverBloc(
      {required this.context,
      required this.moviesApiClient,
      DiscoverState? initialState})
      : super(initialState ?? DiscoverInitial()) {
    on<DiscoverMovies>((event, emit) async {
      try {
        emit(DiscoverLoading(
            message: AppLocalizations.of(context)!.loadingMovies));
        final ApiResponse<List<Movie>> result =
            await moviesApiClient.discoverMovies(page: _page);
        emit(DiscoverLoaded(
            movies: result.data!,
            // ignore: use_build_context_synchronously
            message: AppLocalizations.of(context)!.noMoreMovies));
        _page++;
      } catch (e) {
        emit(DiscoverError(error: e.toString()));
      }
    });
  }
}
