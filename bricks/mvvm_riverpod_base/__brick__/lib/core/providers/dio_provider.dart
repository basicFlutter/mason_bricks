import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../config/dio_config.dart';
import '../config/app_config.dart';

final dioProvider = Provider<Dio>((ref) {
  return DioConfig.createDio(
    baseUrl: AppConfig.apiBaseUrl,
    connectTimeout: const Duration(seconds: AppConfig.connectTimeout),
    receiveTimeout: const Duration(seconds: AppConfig.receiveTimeout),
    sendTimeout: const Duration(seconds: AppConfig.sendTimeout),
  );
}); 