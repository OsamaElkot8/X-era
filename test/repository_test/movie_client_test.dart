import 'package:flutter_test/flutter_test.dart';
import 'package:xera_task/models/entities/movie/movie.dart';
import 'package:xera_task/repository/networks/api_clients/movies/movies_api_client.dart';
import 'package:xera_task/repository/networks/api_response/api_response.dart';

void main() {
  late MoviesApiClient moviesApiClient;
  setUp(() {
    moviesApiClient = MoviesApiClient();
  });

  group(
      "discoverMovies() should return an instance of ApiResponse<List<Movie>>",
      () {
    test(
        "discoverMovies() should return an instance of ApiResponse<List<Movie>> on MoviesApiClient's discoverMovies success",
        () async {
      final result = await moviesApiClient.discoverMovies(page: 1);
      expect(result, isInstanceOf<ApiResponse<List<Movie>>>());
    });

    test(
        "discoverMovies() should return a list of Movie instances on MoviesApiClient's discoverMovies success",
        () async {
      final result = await moviesApiClient.discoverMovies(page: 2);
      expect(result.results, isList);
    });

    test(
        "discoverMovies() should return a list of Movie instances on MoviesApiClient's discoverMovies success",
        () async {
      final result = await moviesApiClient.discoverMovies(page: 1);
      expect(result.results?.first, isInstanceOf<Movie?>());
    });

    test(
        "discoverMovies() should return pages as an instances of int? on MoviesApiClient's discoverMovies success",
        () async {
      final result = await moviesApiClient.discoverMovies(page: 2);
      expect(result.page, isInstanceOf<int?>());
    });

    test(
        "discoverMovies() should return total pages as an instances of int? on MoviesApiClient's discoverMovies success",
        () async {
      final result = await moviesApiClient.discoverMovies(page: 2);
      expect(result.totalPages, isInstanceOf<int?>());
    });

    test(
        "discoverMovies() should return total results as an instances of int? on MoviesApiClient's discoverMovies success",
        () async {
      final result = await moviesApiClient.discoverMovies(page: 2);
      expect(result.totalResults, isInstanceOf<int?>());
    });

    test(
        "searchMovies() should return an instance of ApiResponse<List<Movie>> on MoviesApiClient's searchMovies success",
        () async {
      const String query = 'M3GAN';
      final result = await moviesApiClient.searchMovies(query: query, page: 1);
      expect(result, isInstanceOf<ApiResponse<List<Movie>>>());
    });

    test(
        "searchMovies() should return a list of Movie instances on MoviesApiClient's searchMovies success",
        () async {
      const String query = 'M3GAN';
      final result = await moviesApiClient.searchMovies(query: query, page: 1);
      expect(result.results, isList);
    });

    test(
        "searchMovies() should return a list of Movie instances on MoviesApiClient's searchMovies success",
        () async {
      const String query = 'M3GAN';
      final result = await moviesApiClient.searchMovies(query: query, page: 1);
      expect(result.results?.first, isInstanceOf<Movie?>());
    });

    test(
        "searchMovies() should return pages as an instances of int? on MoviesApiClient's searchMovies success",
        () async {
      const String query = 'M3GAN';
      final result = await moviesApiClient.searchMovies(query: query, page: 1);
      expect(result.page, isInstanceOf<int?>());
    });

    test(
        "searchMovies() should return total pages as an instances of int? on MoviesApiClient's searchMovies success",
        () async {
      const String query = 'M3GAN';
      final result = await moviesApiClient.searchMovies(query: query, page: 1);
      expect(result.totalPages, isInstanceOf<int?>());
    });

    test(
        "searchMovies() should return total results as an instances of int? on MoviesApiClient's searchMovies success",
        () async {
      const String query = 'M3GAN';
      final result = await moviesApiClient.searchMovies(query: query, page: 1);
      expect(result.totalResults, isInstanceOf<int?>());
    });
  });
}
