import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../../main_dev.dart';
import '../global_app_setup/app_config.dart';

import 'interceptors/cookie_interceptor.dart';

import 'interceptors/cors_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:cookie_jar/cookie_jar.dart';

class DioConfig {
  static CookieJar? _cookieJar;

  // Getter برای دسترسی به cookieJar
  static CookieJar get cookieJar {
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

    if (kIsWeb) {
      // برای وب از CookieJar درون‌حافظه استفاده می‌کنیم
      logger.w("🌐 Web platform detected, using in-memory CookieJar");
      _cookieJar = CookieJar();
      logger.f("✅ In-memory CookieJar initialized");
    } else {
      // برای پلتفرم‌های دیگر از PersistCookieJar با ذخیره‌سازی فایل استفاده می‌کنیم
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
      logger.f("✅ PersistCookieJar initialized");
    }
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
        // برای Flutter Web: فعال‌سازی credentials برای CORS
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    // برای Flutter Web: تنظیمات اضافی CORS
    if (kIsWeb) {
      dio.options.extra['withCredentials'] = true;
    }
    final cookieInterceptor = CookieInterceptor(cookieJar, dioInstance: dio);
    dio.interceptors.addAll([
      if (kIsWeb) CorsInterceptor(), // فقط برای وب اضافه می‌شود
      cookieInterceptor,
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
