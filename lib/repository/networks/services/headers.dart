class NetworkHeaders {
  static const Map<String, String> requestHeader = {
    'Authorization': 'Bearer $_accessToken',
    'Content-Type': 'application/json;charset=utf-8'
  };

  static const String _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMmQ2YmE0MThiOTM1NDdjYTAyNGUyOWM4ODk1MjUzYyIsInN1YiI6IjYzY2YwNDlmMzM2ZTAxMDA5ZjhhMDlmNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FoGOGF5mDTHizX_CT3IaFYK4RqGQKTIGp5kUULQFlVg';
}
