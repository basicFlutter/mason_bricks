import 'dart:async';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import '../../../main_dev.dart';
import '../../global_app_setup/app_config.dart';
import '../dio_config.dart';

// Conditional import for Cookie class
import 'cookie_parser_stub.dart'
if (dart.library.io) 'cookie_parser_io.dart'
if (dart.library.html) 'cookie_parser_web.dart'
as cookie_parser;

class CookieInterceptor extends Interceptor {
  final CookieJar cookieJar;
  final Dio? dioInstance;
  bool _isRefreshing = false;
  final List<Completer<Response>> _retryQueue = [];

  CookieInterceptor(this.cookieJar, {this.dioInstance});

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    logger.i(DateTime.now());

    // روی Web، مرورگر خودش کوکی‌ها رو بر اساس withCredentials می‌فرسته
    // پس نباید هدر cookie رو به صورت دستی ست کنیم
    // روی موبایل، باید هدر cookie رو از cookieJar ست کنیم
    if (!kIsWeb) {
      final cookies = await cookieJar.loadForRequest(options.uri);
      if (cookies.isNotEmpty) {
        logger.f(cookies);
        options.headers['cookie'] = cookies
            .map((c) => '${c.name}=${c.value}')
            .join('; ');
      }
    } else {
      // روی Web، فقط لاگ می‌کنیم که کوکی‌ها موجود هستند
      final cookies = await cookieJar.loadForRequest(options.uri);
      if (cookies.isNotEmpty) {
        logger.f(
          '🌐 Web: Cookies available (${cookies.length}), browser will send them automatically',
        );
      }
    }

    logger.w(DateTime.now());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // چک کردن 401 در onResponse (چون validateStatus باعث می‌شه 401 به onResponse بره نه onError)
    if (response.statusCode == 401) {
      logger.w(
        '🔐 401 Unauthorized detected in onResponse, attempting token refresh...',
      );
      final requestOptions = response.requestOptions;

      if (_isRefreshing) {
        final completer = Completer<Response>();
        _retryQueue.add(completer);
        return completer.future.then((r) => handler.resolve(r));
      }

      _isRefreshing = true;

      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          // درخواست اصلی رو تکرار کن
          final newResponse = await _retryRequest(requestOptions);
          // درخواست‌های در صف را هم resolve کن
          for (final c in _retryQueue) {
            c.complete(await _retryRequest(requestOptions));
          }
          _retryQueue.clear();
          handler.resolve(newResponse);
        } else {
          // اگر رفرش موفق نبود، response اصلی رو reject کن
          handler.reject(
            DioException(
              requestOptions: requestOptions,
              response: response,
              type: DioExceptionType.badResponse,
              error: 'Token refresh failed',
            ),
          );
        }
      } finally {
        _isRefreshing = false;
      }
      return;
    }

    // پردازش عادی response برای ذخیره کوکی‌ها
    final setCookies = response.headers['set-cookie'];
    logger.w("📥 Response received from: ${response.requestOptions.uri}");



    if (setCookies != null && setCookies.isNotEmpty) {
      logger.w("🍪 Set-Cookie headers found: ${setCookies.length}");
      final uri = response.requestOptions.uri;
      logger.f("🔗 Saving cookies for URI: $uri");

      final cookies =
      setCookies.map((e) => cookie_parser.parseCookie(e)).toList();

      for (var cookie in cookies) {
        logger.i(
          "💾 Saving cookie: ${cookie.name} = ${cookie.value} (domain: ${cookie.domain}, path: ${cookie.path})",
        );
      }

      await cookieJar.saveFromResponse(uri, cookies);
      logger.i("✅ Cookies saved successfully!");
    } else {
      logger.w("⚠️ No Set-Cookie headers found in response");
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;
    final requestOptions = err.requestOptions;

    if (response?.statusCode == 401) {
      if (_isRefreshing) {
        final completer = Completer<Response>();
        _retryQueue.add(completer);
        return completer.future.then((r) => handler.resolve(r));
      }

      _isRefreshing = true;

      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          // درخواست اصلی رو تکرار کن
          final newResponse = await _retryRequest(requestOptions);
          // درخواست‌های در صف را هم resolve کن
          for (final c in _retryQueue) {
            c.complete(await _retryRequest(requestOptions));
          }
          _retryQueue.clear();
          handler.resolve(newResponse);
        } else {
          handler.next(err);
        }
      } finally {
        _isRefreshing = false;
      }
      return;
    }

    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    logger.w('🔄 Starting token refresh...');

    // استفاده از همان Dio instance اصلی که اینترسپتورها رو داره
    // این باعث می‌شه که روی Web با withCredentials و روی موبایل با cookieJar
    // کوکی‌ها به درستی ارسال بشن
    final dio = dioInstance ?? await DioConfig.createDio();

    try {
      logger.w(
        '📤 Sending refresh token request to /api/v1/auth/refresh-token',
      );
      final res = await dio.post('/api/v1/auth/refresh-token');

      logger.w('📥 Refresh token response status: ${res.statusCode}');
      final setCookies = res.headers['set-cookie'];

      if (setCookies != null && setCookies.isNotEmpty) {
        logger.w(
          '🍪 Set-Cookie headers found in refresh response: ${setCookies.length}',
        );
        final uri = Uri.parse(AppConfig.baseUrl);
        final newCookies =
        setCookies.map((e) => cookie_parser.parseCookie(e)).toList();

        for (var cookie in newCookies) {
          logger.i(
            '💾 Saving refreshed cookie: ${cookie.name} = ${cookie.value.substring(0, cookie.value.length > 20 ? 20 : cookie.value.length)}...',
          );
        }

        await cookieJar.saveFromResponse(uri, newCookies);
        logger.i('✅ Token refreshed successfully and cookies saved.');
        return true;
      } else {
        logger.w('⚠️ No Set-Cookie headers in refresh response');
      }
    } catch (e) {
      logger.e('❌ Failed to refresh token: $e');
      if (e is DioException) {
        logger.e(
          '❌ DioException details: ${e.response?.statusCode} - ${e.response?.data}',
        );
      }
    }
    return false;
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    logger.w(
      '🔄 Retrying request: ${requestOptions.method} ${requestOptions.uri}',
    );

    // استفاده از همان Dio instance که درخواست اصلی رو فرستاده
    // این باعث می‌شه که اینترسپتورها (از جمله CookieInterceptor) به درستی اجرا بشن
    // و کوکی‌های جدید که بعد از رفرش توکن ست شدن، در درخواست جدید استفاده بشن
    final dio = dioInstance ?? await DioConfig.createDio();

    // بررسی کوکی‌های موجود قبل از retry
    final cookies = await cookieJar.loadForRequest(requestOptions.uri);
    logger.w('🍪 Cookies loaded for retry: ${cookies.length}');
    for (var cookie in cookies) {
      logger.i(
        '  🍪 ${cookie.name} = ${cookie.value.substring(0, cookie.value.length > 20 ? 20 : cookie.value.length)}...',
      );
    }

    // ساخت یک RequestOptions جدید با همان تنظیمات ولی بدون هدرهای قدیمی
    // تا اینترسپتورها بتونن هدرهای جدید (مثل کوکی‌های تازه) رو اضافه کنن
    final newOptions = requestOptions.copyWith(headers: <String, dynamic>{});

    logger.w('📤 Sending retry request...');
    final response = await dio.fetch(newOptions);
    logger.w('✅ Retry request successful: ${response.statusCode}');
    return response;
  }
}
