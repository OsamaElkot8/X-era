import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/repository/networks/constants/end_points.dart';

extension MovieExtension on Movie {
  String thumbnailURL() => '${NetworkEndPoints.moviePosterUrl}$posterPath';
}
