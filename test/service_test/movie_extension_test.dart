import 'package:flutter_test/flutter_test.dart';
import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/models/utilities/extensions/movie_extension.dart';

void main() {
  test(
      "Movie poster path url should be https://image.tmdb.org/t/p/original/kuf6dutpsT0vSVehic3EZIqkOBt.jpg",
      () {
    Movie movie = const Movie(posterPath: '/kuf6dutpsT0vSVehic3EZIqkOBt.jpg');
    String result = movie.thumbnailURL();
    expect(result,
        'https://image.tmdb.org/t/p/original/kuf6dutpsT0vSVehic3EZIqkOBt.jpg');
  });
}
