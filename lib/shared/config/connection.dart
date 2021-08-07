const String API_URL = "localhost";

Uri getUri(String path) {
  return new Uri(
    scheme: 'http',
    host: API_URL,
    port: 8000,
    path: path,
  );
}

Uri getUriWithQuery(String path, Map<String, dynamic> query) {
  return new Uri(
    scheme: 'http',
    host: API_URL,
    port: 8000,
    path: path,
    queryParameters: query,
  );
}
