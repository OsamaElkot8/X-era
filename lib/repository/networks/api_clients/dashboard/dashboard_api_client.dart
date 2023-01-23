import 'package:dio/dio.dart' hide Headers;
import 'package:xera_task/models/entities/dashboard/dashboard.dart';
import 'package:xera_task/repository/networks/api_response/api_response.dart';
import 'package:retrofit/http.dart';
import 'package:xera_task/repository/networks/constants/end_points.dart';
import 'package:xera_task/repository/networks/services/dio_services.dart';

part 'dashboard_api_client.g.dart';

@RestApi()
abstract class DashboardApiClient {
  factory DashboardApiClient() => _DashboardApiClient(NetworkDioServices.dio);

  @GET(NetworkEndPoints.studentsDashboard)
  Future<ApiResponse<Dashboard>> fetchDashboard();
}
