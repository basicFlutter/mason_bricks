import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import '../../../main_dev.dart';
import '../../global_app_setup/app_config.dart';

class CookieInterceptor extends Interceptor {
  final PersistCookieJar cookieJar;
  bool _isRefreshing = false;
  final List<Completer<Response>> _retryQueue = [];

  CookieInterceptor(this.cookieJar);

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    logger.i(DateTime.now());
    final cookies = await cookieJar.loadForRequest(options.uri);
    if (cookies.isNotEmpty) {
      logger.f(cookies);
      options.headers[HttpHeaders.cookieHeader] = cookies
          .map((c) => '${c.name}=${c.value}')
          .join('; ');
    }
    logger.w(DateTime.now());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final setCookies = response.headers[HttpHeaders.setCookieHeader];
    logger.w("📥 Response received from: ${response.requestOptions.uri}");

    if (setCookies != null && setCookies.isNotEmpty) {
      logger.w("🍪 Set-Cookie headers found: ${setCookies.length}");
      final uri = response.requestOptions.uri;
      logger.f("🔗 Saving cookies for URI: $uri");

      final cookies = setCookies
          .map((e) => Cookie.fromSetCookieValue(e))
          .toList();

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
    final dio = Dio(BaseOptions(baseUrl: AppConfig.baseUrl));
    final cookies = await cookieJar.loadForRequest(
      Uri.parse(AppConfig.baseUrl),
    );
    dio.options.headers[HttpHeaders.cookieHeader] = cookies
        .map((c) => '${c.name}=${c.value}')
        .join('; ');

    try {
      final res = await dio.post('/api/v1/auth/refresh-token');
      final setCookies = res.headers[HttpHeaders.setCookieHeader];
      if (setCookies != null) {
        final uri = Uri.parse(AppConfig.baseUrl);
        final newCookies = setCookies
            .map((e) => Cookie.fromSetCookieValue(e))
            .toList();
        await cookieJar.saveFromResponse(uri, newCookies);
        logger.i('✅ Token refreshed successfully.');
        return true;
      }
    } catch (e) {
      logger.e('❌ Failed to refresh token: $e');
    }
    return false;
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final dio = Dio();
    final cookies = await cookieJar.loadForRequest(requestOptions.uri);
    if (cookies.isNotEmpty) {
      requestOptions.headers[HttpHeaders.cookieHeader] = cookies
          .map((c) => '${c.name}=${c.value}')
          .join('; ');
    }
    return dio.fetch(requestOptions);
  }
}
