import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '/../core/data/network/api_intercepror.dart';
import '/../core/secure_storage/secure_storage.dart';
import '/../core/data/network/api_interface.dart';
import '../../../app_config.dart';
import '../../constants/constants.dart';
class ApiProvider extends ApiProviderInterface {
  ApiProvider._internal() {
    // Initialize the interceptor here after 'dio' is fully initialized.
    networkServiceInterceptor = NetworkServiceInterceptor(
      SecureStorage(),
      dio,
    );
  }

  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }

  static BaseOptions optionsDio = BaseOptions(
    baseUrl: AppConfig.baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 120),
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
  );

  final Dio dio = Dio(optionsDio);

  late final NetworkServiceInterceptor networkServiceInterceptor;

  @override
  Future<Response> get(path, {dynamic data, Options? options, String? baseUrl}) async {
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }
    return await dio.get(path, queryParameters: data, options: options);
  }

  @override
  Future<Response> post(path, {dynamic data, Options? options, String? baseUrl}) async {
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }
    return await dio.post(path, data: data, options: options);
  }

  @override
  Future<Response> put(path, {Map? data, Options? options}) async =>
      await dio.put(path, data: data, options: options);

  @override
  Future<Response> delete(path, {Options? options}) async =>
      await dio.delete(path, options: options);

  @override
  Future<Response> patch(path, {dynamic data, Options? options}) async =>
      await dio.patch(path, options: options, data: data);

  @override
  void initLogger() async {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: false,
      requestBody: false,
      request: false,
      responseBody: false,
      responseHeader: false,
      compact: false,
      enabled: kDebugMode,
    ));
    setErrorHandler();
  }

  @override
  Future<void> setToken() async {
    dio.options.headers.addAll({"Authorization": "Bearer ${Constants.accessToken}"});
  }

  @override
  void setErrorHandler() {
    dio.interceptors.add(networkServiceInterceptor);
  }
}
