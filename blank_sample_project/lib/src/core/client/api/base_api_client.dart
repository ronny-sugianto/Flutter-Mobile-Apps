/// HTTP Client
abstract class BaseApiClient {
  /// HTTP GET
  Future get(
    String url, {
    String? token,
    responseType,
    Map<String, dynamic> queryParams,
    Map<String, dynamic> headers,
    int msTimeout = 10000,
  });

  /// HTTP PATCH
  Future patch(
    String url, {
    dynamic data,
    String token,
    Map<String, dynamic> headers,
    Map<String, dynamic> queryParams,
    String contentType = 'application/json',
    int msTimeout = 10000,
  });

  /// HTTP POST
  Future post(
    String url, {
    dynamic data,
    String? token,
    Map<String, dynamic> headers,
    Map<String, dynamic> queryParams,
    String contentType = 'application/json',
    int msTimeout = 10000,
  });

  /// HTTP DELETE
  Future delete(
    String url, {
    dynamic data,
    String? token,
    Map<String, dynamic> headers,
    Map<String, dynamic> queryParams,
    String contentType = 'application/json',
    int msTimeout = 10000,
  });

  /// HTTP PUT
  Future put(
    String url, {
    dynamic data,
    String? token,
    Map<String, dynamic> headers,
    Map<String, dynamic> queryParams,
    String contentType = 'application/json',
    int msTimeout = 10000,
  });
}
