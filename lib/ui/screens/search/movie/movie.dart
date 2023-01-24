import 'package:flutter/material.dart';
import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/models/utilities/extensions/movie_extension.dart';
import 'package:xera_task/ui/screens/search/movie/overview.dart';
import 'package:xera_task/ui/screens/search/movie/release_date.dart';
import 'package:xera_task/ui/screens/search/movie/thumbnail.dart';
import 'package:xera_task/ui/screens/search/movie/title.dart';

class SearchMovie extends StatelessWidget {
  final Movie movie;
  const SearchMovie({Key? key, required this.movie}) : super(key: key);

  final double _viewHorizontalPaddingSpace = 18.0,
      _viewVerticalPaddingSpace = 12.0,
      _horizontalDividerWidth = 10.0,
      _titleDividerHeight = 6.0,
      _overviewDividerHeight = 6.0;

  EdgeInsetsGeometry get _viewPadding => EdgeInsets.symmetric(
      vertical: _viewHorizontalPaddingSpace,
      horizontal: _viewVerticalPaddingSpace);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _viewPadding,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchMovieThumbnail(thumbnail: movie.thumbnailURL()),
            SizedBox(
              width: _horizontalDividerWidth,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: SearchMovieTitle(
                      title: movie.title,
                    ),
                  ),
                  SizedBox(
                    height: _titleDividerHeight,
                  ),
                  Flexible(
                    child: SearchMovieOverview(
                      overview: movie.overview,
                    ),
                  ),
                  SizedBox(
                    height: _overviewDividerHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SearchMovieReleaseDate(
                        releaseDate: movie.releaseDate,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
