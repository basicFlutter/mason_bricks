import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<dynamic> properties;

  const Failure([this.properties = const <dynamic>[]]);

  @override
  List<Object?> get props => properties;
}

class ServerFailure extends Failure {
  const ServerFailure() : super();
}

class CacheFailure extends Failure {
  const CacheFailure() : super();
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super();
}

class ValidationFailure extends Failure {
  final String message;
  const ValidationFailure(this.message) : super(const <dynamic>[message]);
}

class AuthenticationFailure extends Failure {
  final String message;
  const AuthenticationFailure(this.message) : super(const <dynamic>[message]);
}

class UnknownFailure extends Failure {
  final String message;
  const UnknownFailure(this.message) : super(const <dynamic>[message]);
} 