import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../main_dev.dart';

/// Interceptor برای مدیریت CORS در Flutter Web
/// 
/// توجه: این interceptor فقط هدرهای لازم را اضافه می‌کند،
/// اما مشکل CORS باید در سمت سرور حل شود.
class CorsInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kIsWeb) {
      // اضافه کردن هدرهای CORS برای درخواست‌های preflight
      options.headers['Access-Control-Request-Method'] = options.method;
      options.headers['Access-Control-Request-Headers'] = 'content-type,accept';
      
      // برای درخواست‌های واقعی، هدرهای اضافی اضافه می‌کنیم
      // اما این هدرها توسط مرورگر تنظیم می‌شوند و نمی‌توانیم آن‌ها را تغییر دهیم
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // اگر خطای CORS باشد، پیام واضح‌تری نمایش می‌دهیم
    if (kIsWeb && err.type == DioExceptionType.connectionError) {
      // این می‌تواند یک خطای CORS باشد
      logger.w('⚠️ CORS Error detected. Make sure your server allows requests from this origin.');
    }
    handler.next(err);
  }
}

