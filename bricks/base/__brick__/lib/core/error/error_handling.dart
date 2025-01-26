import 'package:dio/dio.dart';
import '/core/error/response_error.dart';

class ErrorHandling {
  static final ErrorHandling _instance = ErrorHandling._internal();

  factory ErrorHandling() {
    return _instance;
  }

  ErrorHandling._internal();

  ResponseError handleDioError(DioException error, String fromMethod) {
    if (error.type == DioExceptionType.connectionTimeout) {
      return ResponseError(
        message: "اینترنت خود را بررسی کنید.",
        statusCode: 408,
      );
    } else if (error.type == DioExceptionType.unknown) {
      return ResponseError(
        message: "سرور در دسترسی نمیباشد. لطفا بعدا امتحان کنید.",
        statusCode: 502,
      );
    } else if (error.response?.statusCode == 404) {
      return ResponseError(
        message: error.response?.data["message"] ?? "صفحه مورد نظر یافت نشد.",
        statusCode: error.response?.statusCode??404,
      );
    } else {
      // Extract error message from response data or status message
      final message = error.response?.data["message"]?.toString() ??
          error.response?.statusMessage?.toString();
      return ResponseError(
        message: message??"لطفا بعدا امتحان کنید.",
        statusCode: error.response?.statusCode??500,
      );
    }
  }
}