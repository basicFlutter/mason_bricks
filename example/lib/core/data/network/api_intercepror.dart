import 'package:dio/dio.dart';
import '/../core/secure_storage/flutter_secure_storage_const.dart';
import '/../core/secure_storage/secure_storage.dart';
import '/../core/secure_storage/secure_storage_interface.dart';
class NetworkServiceInterceptor extends Interceptor{
  final SecureStorageInterface _secureStorageInterface;
  final Dio _dio ;
  NetworkServiceInterceptor( this._secureStorageInterface, this._dio);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)async {
    final accessKey = await _secureStorageInterface.read(accessTokeKey);
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    options.headers.addAll({"Authorization": "Bearer $accessKey"});
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if(err.response?.statusCode == 401){
      final refresh = await _secureStorageInterface.read(refreshTokeKey);
    }
    super.onError(err, handler);
  }

}