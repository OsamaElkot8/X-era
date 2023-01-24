// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:dio/src/adapters/io_adapter.dart';
import 'package:xera_task/repository/networks/services/headers.dart';

class NetworkDioServices {
  static final InterceptorsWrapper _interceptorsWrapper = InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll(NetworkHeaders.requestHeader);

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
