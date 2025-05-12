import 'exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is ServerException) {
      return const ServerFailure();
    } else if (error is CacheException) {
      return const CacheFailure();
    } else if (error is NetworkException) {
      return const NetworkFailure();
    } else if (error is ValidationException) {
      return ValidationFailure(error.message);
    } else if (error is AuthenticationException) {
      return AuthenticationFailure(error.message);
    } else if (error is UnknownException) {
      return UnknownFailure(error.message);
    } else {
      return UnknownFailure(error.toString());
    }
  }

  static String getErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'خطا در ارتباط با سرور';
      case CacheFailure:
        return 'خطا در ذخیره‌سازی اطلاعات';
      case NetworkFailure:
        return 'خطا در اتصال به اینترنت';
      case ValidationFailure:
        return (failure as ValidationFailure).message;
      case AuthenticationFailure:
        return (failure as AuthenticationFailure).message;
      case UnknownFailure:
        return (failure as UnknownFailure).message;
      default:
        return 'خطای ناشناخته';
    }
  }
}