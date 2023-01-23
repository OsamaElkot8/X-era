import 'package:xera_task/models/bloc/closable_bloc.dart';
import 'package:xera_task/models/entities/dashboard/dashboard.dart';
import 'package:xera_task/repository/networks/DashBoard/dashboard_api_client.dart';
import 'package:xera_task/repository/networks/api_response/api_response.dart';
import 'package:xera_task/repository/networks/enums/api_status.dart';

import 'dashboard_bloc_event.dart';
import 'dashboard_bloc_state.dart';

class DashboardBloc
    extends ClosableBloc<DashboardBlocEvent, DashboardBlocState> {
  DashboardBloc({DashboardBlocState? initialState})
      : super(initialState ?? DashboardIdle()) {
    on<DashboardFetch>((event, emit) async {
      try {
        emit(DashboardLoading());
        final DashboardApiClient dashboardApiClient = DashboardApiClient();
        final ApiResponse<Dashboard> result =
            await dashboardApiClient.fetchDashboard();
        if (result.status == ApiStatus.success) {
          emit(DashboardLoaded(result.data!));
        } else {
          emit(DashboardLoadingError(reason: result.message?.values.first));
        }
      } catch (e) {
        emit(DashboardLoadingError(reason: e.toString()));
      }
    });
  }
}
