import 'package:xera_task/models/entities/dashboard/dashboard.dart';
import 'package:xera_task/repository/networks/constants/shared_keys.dart';

abstract class DashboardBlocState {}

class DashboardIdle extends DashboardBlocState {}

class DashboardLoading extends DashboardBlocState {}

class DashboardLoaded extends DashboardBlocState {
  final Dashboard dashboard;
  DashboardLoaded(this.dashboard);
}

class DashboardLoadingError extends DashboardBlocState {
  String? reason;
  DashboardLoadingError({this.reason = NetworkSharedKeys.error});
}
