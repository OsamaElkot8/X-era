import 'package:flutter/material.dart';
import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/ui/screens/discover/movie/overview.dart';
import 'package:xera_task/ui/screens/discover/movie/release_date.dart';
import 'package:xera_task/ui/screens/discover/movie/thumbnail.dart';
import 'package:xera_task/ui/screens/discover/movie/title.dart';

class DiscoverMovie extends StatelessWidget {
  final Movie movie;
  const DiscoverMovie({Key? key, required this.movie}) : super(key: key);

  final double _cardRadiusCircular = 20.0,
      _cardElevation = 12.0,
      _titleDividerHeight = 20.0,
      _overviewDividerHeight = 20.0;
  OutlinedBorder get _cardShape => RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(_cardRadiusCircular)));

  final double _cardDetailsHorizontalPaddingSpace = 10.0,
      _cardDetailsVerticalPaddingSpace = 24.0;

  EdgeInsetsGeometry get _cardDetailsPadding => EdgeInsets.symmetric(
      horizontal: _cardDetailsHorizontalPaddingSpace,
      vertical: _cardDetailsVerticalPaddingSpace);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: _cardShape,
      elevation: _cardElevation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DiscoverMovieThumbnail(thumbnail: movie.posterPath),
          Padding(
            padding: _cardDetailsPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DiscoverMovieTitle(title: movie.title),
                SizedBox(
                  height: _titleDividerHeight,
                ),
                DiscoverMovieOverview(overview: movie.overview),
                SizedBox(
                  height: _overviewDividerHeight,
                ),
                DiscoverMovieReleaseDate(
                  releaseDate: movie.releaseDate,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
