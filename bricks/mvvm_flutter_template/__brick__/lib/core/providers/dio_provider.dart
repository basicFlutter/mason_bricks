import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../config/dio_config.dart';

final dioProvider = Provider<Dio>((ref) {
  return DioConfig.createDio();
}); 