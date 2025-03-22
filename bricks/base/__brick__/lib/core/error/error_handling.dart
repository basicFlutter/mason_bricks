import 'package:dio/dio.dart';
import '/core/error/response_error.dart';

class ErrorHandling {
  static final ErrorHandling _instance = ErrorHandling._internal();

  factory ErrorHandling() => _instance;

  ErrorHandling._internal();

  ResponseError handleDioError(DioException error, String sourceMethod) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return _createResponseError("اینترنت خود را بررسی کنید.", 408);
      case DioExceptionType.receiveTimeout:
        return _createResponseError("زمان دریافت پاسخ به پایان رسید.", 408);
      case DioExceptionType.sendTimeout:
        return _createResponseError("زمان ارسال درخواست به پایان رسید.", 408);
      case DioExceptionType.cancel:
        return _createResponseError("درخواست لغو شد.", 499);
      case DioExceptionType.badResponse:
        return _createResponseError("پاسخ نامناسب از سرور دریافت شد.", error.response?.statusCode ?? 500);
      case DioExceptionType.unknown:
        return _createResponseError("سرور در دسترسی نمیباشد. لطفا بعدا امتحان کنید.", 502);
      default:
        return _handleResponseError(error);
    }
  }

  ResponseError _handleResponseError(DioException error) {
    switch (error.response?.statusCode) {
      case 401:
        return _createResponseError(
          "دسترسی غیرمجاز. لطفاً وارد حساب کاربری خود شوید.",
          401,
        );
      case 402:
        return _createResponseError(
          "پرداخت مورد نیاز است. لطفاً پرداخت خود را تکمیل کنید.",
          402,
        );
      case 403:
        return _createResponseError(
          "دسترسی ممنوع. شما اجازه دسترسی به این منبع را ندارید.",
          403,
        );
      case 404:
        return _createResponseError(
          error.response?.data["message"] ?? "صفحه مورد نظر یافت نشد.",
          404,
        );
      default:
        final message = error.response?.data["message"]?.toString() ??
            error.response?.statusMessage?.toString() ??
            "لطفا بعدا امتحان کنید.";
        return _createResponseError(message, error.response?.statusCode ?? 500);
    }
  }

  ResponseError _createResponseError(String message, int statusCode) {
    return ResponseError(
      message: message,
      statusCode: statusCode,
    );
  }
}