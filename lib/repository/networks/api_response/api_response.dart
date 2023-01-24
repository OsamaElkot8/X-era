import 'package:json_annotation/json_annotation.dart';
import 'package:xera_task/repository/networks/constants/shared_keys.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  int? page;
  T? data;
  @JsonKey(name: NetworkSharedKeys.totalPages)
  final int? totalPages;
  @JsonKey(name: NetworkSharedKeys.totalResults)
  final int? totalResults;

  ApiResponse({this.page, this.data, this.totalPages, this.totalResults});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$ApiResponseFromJson<T>(json, fromJsonT);
  }

  Map<String, dynamic> toJson(
    Map<String, dynamic> Function(T value) toJsonT,
  ) {
    return _$ApiResponseToJson<T>(this, toJsonT);
  }
}
