import 'dart:io';

class NetworkHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }

  static void setHttpOverrides() =>
      HttpOverrides.global = NetworkHttpOverrides();
}
