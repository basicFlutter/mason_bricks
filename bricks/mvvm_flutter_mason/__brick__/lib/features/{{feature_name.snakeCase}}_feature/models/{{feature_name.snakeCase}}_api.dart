import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/exports.dart';
import '{{feature_name.snakeCase}}_feature_model.dart';

final {{ feature_name.camelCase() }}ApiProvider = Provider<{{ feature_name.pascalCase() }}Api>((ref) {
  return {{ feature_name.pascalCase() }}Api(ref.watch(apiClientProvider));
});

class {{ feature_name.pascalCase() }}Api {
  final ApiClient _client;

  {{ feature_name.pascalCase() }}Api(this._client);

  Future<List<{{ feature_name.pascalCase() }}Model>> getAll() async {
    try {
      final response = await _client.get('/{{ feature_name }}');
      return (response as List)
          .map((json) => {{ feature_name.pascalCase() }}Model.fromJson(json))
          .toList();
    } catch (e) {
      throw ErrorHandler.handleError(ServerException());
    }
  }

  Future<{{ feature_name.pascalCase() }}Model> getById(int id) async {
    try {
      final response = await _client.get('/{{ feature_name }}/$id');
      return {{ feature_name.pascalCase() }}Model.fromJson(response);
    } catch (e) {
      throw ErrorHandler.handleError(ServerException());
    }
  }

  Future<{{ feature_name.pascalCase() }}Model> create({{ feature_name.pascalCase() }}Model model) async {
    try {
      final response = await _client.post(
        '/{{ feature_name }}',
        data: model.toJson(),
      );
      return {{ feature_name.pascalCase() }}Model.fromJson(response);
    } catch (e) {
      throw ErrorHandler.handleError(ServerException());
    }
  }

  Future<{{ feature_name.pascalCase() }}Model> update(int id, {{ feature_name.pascalCase() }}Model model) async {
    try {
      final response = await _client.put(
        '/{{ feature_name }}/$id',
        data: model.toJson(),
      );
      return {{ feature_name.pascalCase() }}Model.fromJson(response);
    } catch (e) {
      throw ErrorHandler.handleError(ServerException());
    }
  }

  Future<void> delete(int id) async {
    try {
      await _client.delete('/{{ feature_name }}/$id');
    } catch (e) {
      throw ErrorHandler.handleError(ServerException());
    }
  }

  Future<{{ feature_name.pascalCase() }}Model> patch(int id, {{ feature_name.pascalCase() }}Model model) async {
    try {
      final response = await _client.patch(
        '/{{ feature_name }}/$id',
        data: model.toJson(),
      );
      return {{ feature_name.pascalCase() }}Model.fromJson(response);
    } catch (e) {
      throw ErrorHandler.handleError(ServerException());
    }
  }
} 