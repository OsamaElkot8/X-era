// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/repository/networks/api_response/api_response.dart';
import 'package:xera_task/repository/networks/constants/end_points.dart';
import 'package:xera_task/repository/networks/constants/shared_keys.dart';
import 'package:xera_task/repository/networks/services/dio_services.dart';
import 'package:xera_task/repository/networks/services/headers.dart';

part 'movies_api_client.g.dart';

@RestApi(baseUrl: NetworkEndPoints.baseUrl)
@Headers(NetworkHeaders.requestHeader)
abstract class MoviesApiClient {
  factory MoviesApiClient() => _MoviesApiClient(NetworkDioServices.dio);

  @GET(NetworkEndPoints.discoverMovie)
  Future<ApiResponse<List<Movie>>> discoverMovies(
      {@Query(NetworkSharedKeys.page) int? page});

  @GET(NetworkEndPoints.searchMovie)
  Future<ApiResponse<List<Movie>>> searchMovies(
      {@Query(NetworkSharedKeys.query) required String query,
      @Query(NetworkSharedKeys.page) int? page});
}
