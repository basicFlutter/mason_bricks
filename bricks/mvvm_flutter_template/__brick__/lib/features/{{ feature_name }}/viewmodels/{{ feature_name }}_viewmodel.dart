// ViewModel مربوط به ویژگی با استفاده از Riverpod Generator
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/{{ feature_name }}_model.dart';
import '../../../data/repositories/{{ feature_name }}_repository.dart';

part '{{ feature_name }}_viewmodel.g.dart';

@riverpod
class {{ feature_name.pascalCase() }}ViewModel extends _${{ feature_name.pascalCase() }}ViewModel {
  @override
  FutureOr<{{ feature_name.pascalCase() }}Model?> build() async {
    return null;
  }

  Future<void> loadData() async {
    state = const AsyncLoading();
    try {
      final repository = {{ feature_name.pascalCase() }}Repository(
        api: ref.read({{ feature_name.camelCase() }}ApiProvider),
      );
      final result = await repository.getData();
      state = AsyncData(result);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
} 