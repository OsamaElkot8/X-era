import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xera_task/models/bloc/search/search_bloc.dart';
import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:xera_task/ui/components/movies_error_refresh.dart';
import 'package:xera_task/ui/screens/search/empty_movies_list.dart';
import 'package:xera_task/ui/screens/search/movie/movie.dart';
import 'package:xera_task/ui/screens/search/search_field/search_field.dart';
import 'package:xera_task/ui/ui_helper.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final double _pageHorizontalPaddingSpace = 18.0,
      _pageVerticalPaddingSpace = 12.0,
      _moviesListHorizontalPaddingSpace = 18.0;

  EdgeInsetsGeometry get _pagePadding => EdgeInsets.symmetric(
      horizontal: _pageHorizontalPaddingSpace,
      vertical: _pageVerticalPaddingSpace);

  EdgeInsetsGeometry get _moviesListPadding =>
      EdgeInsets.symmetric(horizontal: _moviesListHorizontalPaddingSpace);

  final List<Movie> _movies = [];
  final ScrollController _scrollController = ScrollController();

  void _newSearchRequest(BuildContext context, {required String query}) {
    _movies.clear();
    SearchBloc controller = context.read<SearchBloc>();
    controller.query = query;
    controller.isFetching = false;
    controller.page = 1;
    controller.add(SearchMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _pagePadding,
      child: Column(
        children: [
          SearchMovieField(
            onFieldSubmitted: (value){
              if(value.isNotEmpty){
                _newSearchRequest(context, query: value);
              }
    },
            onSuggestionSelected: (suggestion) =>
                _newSearchRequest(context, query: suggestion),
          ),
          Expanded(
            child: Center(
              child: BlocConsumer<SearchBloc, SearchState>(
                listener: (context, searchState) {
                  UIHelper uIHelper = UIHelper.instance;
                  SearchBloc controller = context.read<SearchBloc>();

                  switch (searchState.runtimeType) {
                    case SearchLoading:
                      uIHelper.showSnackBarMessage(context,
                          message: AppLocalizations.of(context)!.loadingMovies);
                      break;
                    case SearchLoaded:
                      final casted = searchState as SearchLoaded;
                      if (casted.movies.isEmpty) {
                        uIHelper.showSnackBarMessage(context,
                            message:
                                AppLocalizations.of(context)!.noMoreMovies);
                      }
                      SharedPreferences.instance
                          .saveToMoviesSearchHistory(query: controller.query);
                      break;
                    case SearchError:
                      final casted = searchState as SearchError;
                      uIHelper.showSnackBarMessage(context,
                          message: casted.error);
                      controller.isFetching = false;
                      break;
                    default:
                      break;
                  }
                },
                builder: (context, searchState) {
                  SearchBloc controller = context.read<SearchBloc>();
                  if (searchState is SearchLoading && _movies.isEmpty) {
                    return const CircularProgressIndicator();
                  } else if (searchState is SearchLoaded) {
                    _movies.addAll(searchState.movies);

                    controller.isFetching = false;
                    UIHelper.instance.hideCurrentSnackBar(context);
                    if (_movies.isEmpty) {
                      return const SearchMovieEmptyList();
                    }
                  } else if (searchState is SearchError && _movies.isEmpty) {
                    return MoviesErrorRefresh(
                      error: searchState.error,
                      onPressed: () => controller
                        ..isFetching = true
                        ..add(SearchMovies()),
                    );
                  }
                  return ListView.separated(
                      padding: _moviesListPadding,
                      controller: _scrollController
                        ..addListener(() {
                          if (_scrollController.offset ==
                                  _scrollController.position.maxScrollExtent &&
                              !controller.isFetching) {
                            controller
                              ..isFetching = true
                              ..add(SearchMovies());
                          }
                        }),
                      itemBuilder: (ctx, index) =>
                          SearchMovie(movie: _movies[index]),
                      separatorBuilder: (ctx, index) => const Divider(),
                      itemCount: _movies.length);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
