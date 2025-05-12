class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

class TimeoutException implements Exception {}

class BadRequestException implements Exception {}

class UnauthorizedException implements Exception {}

class ForbiddenException implements Exception {}

class NotFoundException implements Exception {}

class RequestCancelledException implements Exception {}

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);
}

class AuthenticationException implements Exception {
  final String message;
  AuthenticationException(this.message);
}

class UnknownException implements Exception {
  final String message;
  UnknownException(this.message);
}