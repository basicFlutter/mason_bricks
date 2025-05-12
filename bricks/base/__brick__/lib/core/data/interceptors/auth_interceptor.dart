import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import '../token_provider.dart';

class AuthInterceptor extends Interceptor {
  final Ref ref;

  AuthInterceptor(this.ref);

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final tokens = await ref.read(tokenProvider.future);
    if (tokens.accessToken != null) {
      options.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
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
        final tokens = await ref.read(tokenProvider.future);
        if (tokens.refreshToken != null) {
          // اینجا باید درخواست refresh token را به سرور ارسال کنید
          // و توکن‌های جدید را دریافت کنید
          // مثال:
          // final response = await dio.post('/refresh-token', data: {'refresh_token': tokens.refreshToken});
          // await ref.read(tokenProvider.notifier).refreshAccessToken(response.data['access_token']);

          // تکرار درخواست اصلی
          final newTokens = await ref.read(tokenProvider.future);
          err.requestOptions.headers['Authorization'] = 'Bearer ${newTokens.accessToken}';
          final response = await Dio().fetch(err.requestOptions);
          return handler.resolve(response);
        }
      } catch (e) {
        // در صورت خطا در refresh token، کاربر را logout کنید
        await ref.read(tokenProvider.notifier).clearTokens();
        // TODO: Navigate to login screen
      }
    }
    return handler.next(err);
  }
}