// provider مربوط به API یا سرویس‌های داده‌ای
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../../core/providers/dio_provider.dart';
import '{{ feature_name }}_model.dart';

final {{ feature_name.camelCase() }}ApiProvider = Provider<{{ feature_name.pascalCase() }}Api>((ref) {
  final dio = ref.watch(dioProvider);
  return {{ feature_name.pascalCase() }}Api(dio);
});

class {{ feature_name.pascalCase() }}Api {
  final Dio _dio;

  {{ feature_name.pascalCase() }}Api(this._dio);

  Future<List<{{ feature_name.pascalCase() }}Model>> getAll() async {
    try {
      final response = await _dio.get('/{{ feature_name }}');
      return (response.data as List)
          .map((json) => {{ feature_name.pascalCase() }}Model.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('خطا در دریافت لیست {{ feature_name }}: $e');
    }
  }

  Future<{{ feature_name.pascalCase() }}Model> getById(int id) async {
    try {
      final response = await _dio.get('/{{ feature_name }}/$id');
      return {{ feature_name.pascalCase() }}Model.fromJson(response.data);
    } catch (e) {
      throw Exception('خطا در دریافت {{ feature_name }} با شناسه $id: $e');
    }
  }

  Future<{{ feature_name.pascalCase() }}Model> create({{ feature_name.pascalCase() }}Model model) async {
    try {
      final response = await _dio.post(
        '/{{ feature_name }}',
        data: model.toJson(),
      );
      return {{ feature_name.pascalCase() }}Model.fromJson(response.data);
    } catch (e) {
      throw Exception('خطا در ایجاد {{ feature_name }}: $e');
    }
  }

  Future<{{ feature_name.pascalCase() }}Model> update(int id, {{ feature_name.pascalCase() }}Model model) async {
    try {
      final response = await _dio.put(
        '/{{ feature_name }}/$id',
        data: model.toJson(),
      );
      return {{ feature_name.pascalCase() }}Model.fromJson(response.data);
    } catch (e) {
      throw Exception('خطا در بروزرسانی {{ feature_name }} با شناسه $id: $e');
    }
  }

  Future<void> delete(int id) async {
    try {
      await _dio.delete('/{{ feature_name }}/$id');
    } catch (e) {
      throw Exception('خطا در حذف {{ feature_name }} با شناسه $id: $e');
    }
  }
} 