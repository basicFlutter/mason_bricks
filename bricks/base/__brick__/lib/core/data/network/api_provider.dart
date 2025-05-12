import 'package:dio/dio.dart';
import '../../error/exceptions.dart';
import '../../error/failures.dart';
import '../dio_config.dart';
import 'network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
abstract class ApiProviderInterface {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String path, {dynamic data});
  Future<dynamic> put(String path, {dynamic data});
  Future<dynamic> delete(String path);
  Future<dynamic> patch(String path, {dynamic data});
}

class ApiProvider implements ApiProviderInterface {
  final Dio _dio;
  final NetworkInfo _networkInfo;

  ApiProvider._internal(this._dio, this._networkInfo);

  static ApiProvider? _instance;
  static ApiProvider get instance {
    _instance ??= ApiProvider._internal(
      DioConfig.createDio(),
      NetworkInfoImpl(InternetConnectionChecker.createInstance()),
    );
    return _instance!;
  }

  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      if (!await _networkInfo.isConnected) {
        throw NetworkFailure();
      }
      final response = await _dio.get(path, queryParameters: queryParameters);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      if (!await _networkInfo.isConnected) {
        throw NetworkFailure();
      }
      final response = await _dio.post(path, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<dynamic> put(String path, {dynamic data}) async {
    try {
      if (!await _networkInfo.isConnected) {
        throw NetworkFailure();
      }
      final response = await _dio.put(path, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<dynamic> delete(String path) async {
    try {
      if (!await _networkInfo.isConnected) {
        throw NetworkFailure();
      }
      final response = await _dio.delete(path);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<dynamic> patch(String path, {dynamic data}) async {
    try {
      if (!await _networkInfo.isConnected) {
        throw NetworkFailure();
      }
      final response = await _dio.patch(path, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ServerException();
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data;
    } else {
      throw ServerException();
    }
  }

  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case 400:
            return BadRequestException();
          case 401:
            return UnauthorizedException();
          case 403:
            return ForbiddenException();
          case 404:
            return NotFoundException();
          case 500:
            return ServerException();
          default:
            return ServerException();
        }
      case DioExceptionType.cancel:
        return RequestCancelledException();
      default:
        return ServerException();
    }
  }
} 