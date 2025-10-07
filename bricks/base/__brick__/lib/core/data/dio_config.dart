import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../global_app_setup/app_config.dart';

import 'interceptors/cookie_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:cookie_jar/cookie_jar.dart';
class DioConfig {
  static Future<Dio> createDio({
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) async {
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


    final dir = await getApplicationDocumentsDirectory();
    final cookieDir = join(dir.path, '.cookies');
    await Directory(cookieDir).create(recursive: true);

    final cookieJar = PersistCookieJar(
      storage: FileStorage(cookieDir),
      ignoreExpires: true,
    );


    dio.interceptors.addAll([
      CookieInterceptor(cookieJar),
      // AuthInterceptor(),
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