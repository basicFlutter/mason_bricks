import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String? Function()? getToken;

  AuthInterceptor({this.getToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = getToken?.call();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Handle token refresh or logout here
    }
    handler.next(err);
  }
} 