import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xera_task/models/bloc/discover/discover_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/paints/night_stars_paint.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/repository/networks/api_clients/movies/movies_api_client.dart';
import 'package:xera_task/ui/components/movies_error_refresh.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';
import 'package:xera_task/ui/screens/discover/empty_movies_list.dart';
import 'package:xera_task/ui/screens/discover/movie/movie.dart';
import 'package:xera_task/ui/ui_helper.dart';

class DiscoverPage extends StatelessWidget {
  DiscoverPage({Key? key}) : super(key: key);

  final double _viewVerticalPaddingSpace = 24.0,
      _viewHorizontalPaddingSpace = 18.0,
      _dividerHeight = 24.0;

  EdgeInsetsGeometry get _viewPadding => EdgeInsets.symmetric(
      vertical: _viewVerticalPaddingSpace,
      horizontal: _viewHorizontalPaddingSpace);

  final List<Movie> _movies = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
        builder: (context, state) {
      final LocalSettings settings = state.settings;
      final UiConstantsManager currentThemeModeConstants = SettingsService
          .instance
          .currentThemeModeConstants(localSettings: settings);

      return CustomPaint(
        painter: NightStarsPaint(
            upperColor: currentThemeModeConstants.colorPrimary,
            lowerColor: currentThemeModeConstants.colorScaffoldBackground),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: BlocProvider<DiscoverBloc>(
            create: (context) => DiscoverBloc(
              moviesApiClient: MoviesApiClient(),
            )..add(DiscoverMovies()),
            child: Center(
              child: BlocConsumer<DiscoverBloc, DiscoverState>(
                listener: (context, discoverState) {
                  UIHelper uIHelper = UIHelper.instance;

                  switch (discoverState.runtimeType) {
                    case DiscoverLoading:
                      uIHelper.showSnackBarMessage(context,
                          message: AppLocalizations.of(context)!.loadingMovies);
                      break;
                    case DiscoverLoaded:
                      final casted = discoverState as DiscoverLoaded;
                      if (casted.movies.isEmpty) {
                        uIHelper.showSnackBarMessage(context,
                            message:
                                AppLocalizations.of(context)!.noMoreMovies);
                      }
                      break;
                    case DiscoverError:
                      final casted = discoverState as DiscoverError;
                      uIHelper.showSnackBarMessage(context,
                          message: casted.error);
                      context.read<DiscoverBloc>().isFetching = false;
                      break;
                    default:
                      break;
                  }
                },
                builder: (context, discoverState) {
                  DiscoverBloc controller = context.read<DiscoverBloc>();
                  if (discoverState is DiscoverInitial ||
                      discoverState is DiscoverLoading && _movies.isEmpty) {
                    return const CircularProgressIndicator();
                  } else if (discoverState is DiscoverLoaded) {
                    _movies.addAll(discoverState.movies);

                    controller.isFetching = false;
                    UIHelper.instance.hideCurrentSnackBar(context);
                    if (_movies.isEmpty) {
                      return const DiscoverMovieEmptyList();
                    }
                  } else if (discoverState is DiscoverError &&
                      _movies.isEmpty) {
                    return MoviesErrorRefresh(
                      error: discoverState.error,
                      onPressed: () => controller
                        ..isFetching = true
                        ..add(DiscoverMovies()),
                    );
                  }
                  return ListView.separated(
                      padding: _viewPadding,
                      controller: _scrollController
                        ..addListener(() {
                          if (_scrollController.offset ==
                                  _scrollController.position.maxScrollExtent &&
                              !controller.isFetching) {
                            controller
                              ..isFetching = true
                              ..add(DiscoverMovies());
                          }
                        }),
                      itemBuilder: (ctx, index) =>
                          DiscoverMovie(movie: _movies[index]),
                      separatorBuilder: (ctx, index) => SizedBox(
                            height: _dividerHeight,
                          ),
                      itemCount: _movies.length);
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
