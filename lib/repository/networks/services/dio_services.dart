// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:dio/src/adapters/io_adapter.dart';
import 'package:xera_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:xera_task/repository/networks/constants/end_points.dart';
import 'package:xera_task/repository/networks/constants/shared_keys.dart';

class NetworkDioServices {
  static const Map<String, dynamic> requestQueryParameters = {
    NetworkSharedKeys.mobile: true
  };

  static final InterceptorsWrapper _interceptorsWrapper = InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
    if (NetworkEndPoints.baseUrl != null) {
      options.baseUrl = NetworkEndPoints.baseUrl!;
    }

    SharedPreferences localStorage = SharedPreferences.instance;
    String? token = await localStorage.getUserToken();

    if (token != null) {
      options.headers["Authorization"] = 'Bearer $token';
    }
    options.queryParameters.addAll(requestQueryParameters);
    handler.next(options);
  });
  static final DefaultHttpClientAdapter _httpClientAdapter =
      DefaultHttpClientAdapter()
        ..onHttpClientCreate = (HttpClient dioClient) {
          dioClient.badCertificateCallback =
              ((X509Certificate cert, String host, int port) => true);
          return dioClient;
        };
  static final Dio dio = Dio()
    ..interceptors.add(_interceptorsWrapper)
    ..httpClientAdapter = _httpClientAdapter;
}
