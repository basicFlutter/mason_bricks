// ViewModel مربوط به ویژگی با استفاده از Riverpod Generator
import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/{{ feature_name }}_model.dart';
import '../models/{{ feature_name }}_api.dart';

part '{{ feature_name }}_viewmodel.g.dart';

@riverpod
class {{ feature_name.pascalCase() }}ViewModel extends _${{ feature_name.pascalCase() }}ViewModel {
  @override
  FutureOr<List<{{ feature_name.pascalCase() }}Model>> build() async {
    return [];
  }

  Future<void> loadAll() async {
    state = const AsyncLoading();
    try {
      final api = ref.read({{ feature_name.camelCase() }}ApiProvider);
      final result = await api.getAll();
      state = AsyncData(result);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> create({{ feature_name.pascalCase() }}Model model) async {
    state = const AsyncLoading();
    try {
      final api = ref.read({{ feature_name.camelCase() }}ApiProvider);
      await api.create(model);
      final result = await api.getAll();
      state = AsyncData(result);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> updateItem(int id, {{ feature_name.pascalCase() }}Model model) async {
    state = const AsyncLoading();
    try {
      final api = ref.read({{ feature_name.camelCase() }}ApiProvider);
      await api.update(id, model);
      final result = await api.getAll();
      state = AsyncData(result);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }

  Future<void> delete(int id) async {
    state = const AsyncLoading();
    try {
      final api = ref.read({{ feature_name.camelCase() }}ApiProvider);
      await api.delete(id);
      final result = await api.getAll();
      state = AsyncData(result);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
} 