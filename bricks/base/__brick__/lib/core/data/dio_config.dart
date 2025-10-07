import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../../main_dev.dart';
import '../global_app_setup/app_config.dart';

import 'interceptors/cookie_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:cookie_jar/cookie_jar.dart';
class DioConfig {
  static PersistCookieJar? _cookieJar;

  // Getter برای دسترسی به cookieJar
  static PersistCookieJar get cookieJar {
    if (_cookieJar == null) {
      throw Exception(
        'CookieJar not initialized. Call DioConfig.initCookieJar() first.',
      );
    }
    return _cookieJar!;
  }

  // مقداردهی یکبار cookieJar
  static Future<void> initCookieJar() async {
    if (_cookieJar != null) return; // اگر قبلاً مقداردهی شده، دوباره نکن

    final dir = await getApplicationDocumentsDirectory();
    final cookieDir = join(dir.path, '.cookies');

    // ✅ بررسی وجود پوشه قبل از ساخت
    final cookieDirectory = Directory(cookieDir);
    if (!await cookieDirectory.exists()) {
      logger.w("Cookie directory not exists, creating...");
      await cookieDirectory.create(recursive: true);
    } else {
      logger.w("Cookie directory exists");
    }

    logger.f("Cookie directory: $cookieDir");
    _cookieJar = PersistCookieJar(
      storage: FileStorage(cookieDir),
      ignoreExpires: true,
    );
  }

  static Future<Dio> createDio({
    String? baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) async {
    // اطمینان از مقداردهی cookieJar
    await initCookieJar();

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
        enabled: kDebugMode,
      ),
    ]);

    return dio;
  }
}
