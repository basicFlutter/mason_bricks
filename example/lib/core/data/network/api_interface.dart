import 'package:dio/dio.dart';

abstract class ApiProviderInterface {
  Future<Response> get(path, {Options? options});

  Future<Response> put(path, {Map? data, Options? options});

  Future<Response> post(path, {Map? data, Options? options});

  Future<Response> delete(path, {Options? options});

  Future<Response> patch(path, {Map? data, Options? options});

  Future<void> setToken();

  void initLogger();
  void setErrorHandler();
}
