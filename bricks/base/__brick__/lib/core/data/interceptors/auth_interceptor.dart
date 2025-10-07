import 'package:dio/dio.dart';
import '../token_manager.dart';

class AuthInterceptor extends Interceptor {

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final tokens =await TokenManager.getAccessToken();
    if (tokens != null) {
      options.headers['Authorization'] = 'Bearer $tokens';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = await TokenManager.getRefreshToken();
        if (refreshToken != null) {
          // اینجا باید درخواست refresh token را به سرور ارسال کنید
          // و توکن‌های جدید را دریافت کنید
          // مثال:
          // final response = await dio.post('/refresh-token', data: {'refresh_token': tokens.refreshToken});
          // await ref.read(tokenProvider.notifier).refreshAccessToken(response.data['access_token']);

          // تکرار درخواست اصلی
          final newTokens = await TokenManager.getAccessToken();
          err.requestOptions.headers['Authorization'] = 'Bearer $newTokens';
          final response = await Dio().fetch(err.requestOptions);
          return handler.resolve(response);
        }
      } catch (e) {
        // در صورت خطا در refresh token، کاربر را logout کنید
        await TokenManager.clearTokens();
        // TODO: Navigate to login screen
      }
    }
    return handler.next(err);
  }
}