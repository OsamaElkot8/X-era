import 'package:json_annotation/json_annotation.dart';
import 'package:xera_task/repository/networks/constants/shared_keys.dart';

part 'dashboard.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Dashboard {
  @JsonKey(name: NetworkSharedKeys.passedCourses)
  final int? passedCourses;

  const Dashboard({this.passedCourses});

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}
