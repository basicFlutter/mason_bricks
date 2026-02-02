import 'package:dio/dio.dart';
import '../dio_config.dart';

abstract class ApiProviderInterface {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String path, {dynamic data});
  Future<dynamic> put(String path, {dynamic data});
  Future<dynamic> delete(String path);
  Future<dynamic> patch(String path, {dynamic data});
}

class ApiProvider implements ApiProviderInterface {
  final Dio _dio;

  ApiProvider._internal(this._dio);

  static ApiProvider? _instance;

  static Future<void> init() async {
    if (_instance != null) return;

    final dio = await DioConfig.createDio();
    _instance = ApiProvider._internal(dio);
  }

  static ApiProvider get instance {
    if (_instance == null) {
      throw Exception(
        '⚠️ ApiProvider not initialized. Call ApiProvider.init() first.',
      );
    }
    return _instance!;
  }

  @override
  Future<dynamic> get(
      String path, {
        Map<String, dynamic>? queryParameters,
      }) async {
    final response = await _dio.get(path, queryParameters: queryParameters);
    _checkResponseStatus(response);
    return response.data;
  }

  @override
  Future<dynamic> post(String path, {dynamic data}) async {
    final response = await _dio.post(path, data: data);
    _checkResponseStatus(response);
    return response.data;
  }

  @override
  Future<dynamic> put(String path, {dynamic data}) async {
    final response = await _dio.put(path, data: data);
    _checkResponseStatus(response);
    return response.data;
  }

  @override
  Future<dynamic> delete(String path) async {
    final response = await _dio.delete(path);
    _checkResponseStatus(response);
    return response.data;
  }

  @override
  Future<dynamic> patch(String path, {dynamic data}) async {
    final response = await _dio.patch(path, data: data);
    _checkResponseStatus(response);
    return response.data;
  }

  /// Checks if response status code is successful, otherwise throws DioException
  void _checkResponseStatus(Response response) {
    final statusCode = response.statusCode;
    if (statusCode == null || statusCode < 200 || statusCode >= 300) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'HTTP $statusCode',
        message: response.data['message'] ?? 'خطا در ارتباط با سرور',
      );
    }
  }
}
