import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../global_app_setup/app_config.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfig {
  static Dio createDio({
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? AppConfig.baseUrl,
        connectTimeout: connectTimeout ?? const Duration(seconds: 30),
        receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
        sendTimeout: sendTimeout ?? const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(),
      LoggingInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,)
    ]);

    return dio;
  }
}