import 'package:json_annotation/json_annotation.dart';
import 'package:xera_task/repository/networks/constants/shared_keys.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: NetworkSharedKeys.posterPath)
  final String? posterPath;
  @JsonKey(name: NetworkSharedKeys.originalTitle)
  final String? title;
  final String? overview;
  @JsonKey(name: NetworkSharedKeys.releaseDate)
  final String? releaseDate;

  const Movie({this.posterPath, this.title, this.overview, this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
