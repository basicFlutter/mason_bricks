import 'package:dio/dio.dart';
import '../config/dio_config.dart';
abstract class ApiClient {
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String path, {dynamic data});
  Future<dynamic> put(String path, {dynamic data});
  Future<dynamic> delete(String path);
}

class DioClient implements ApiClient {
  final Dio _dio;

  DioClient._internal(this._dio);

  static DioClient? _instance;
  static DioClient get instance {
    _instance ??= DioClient._internal(DioConfig.createDio());
    return _instance!;
  }

  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      throw Exception('خطا در دریافت داده: $e');
    }
  }

  @override
  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } catch (e) {
      throw Exception('خطا در ارسال داده: $e');
    }
  }

  @override
  Future<dynamic> put(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response.data;
    } catch (e) {
      throw Exception('خطا در بروزرسانی داده: $e');
    }
  }

  @override
  Future<dynamic> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response.data;
    } catch (e) {
      throw Exception('خطا در حذف داده: $e');
    }
  }
} 