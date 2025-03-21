// ViewModel مربوط به ویژگی با استفاده از StateNotifier و Riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/{{ feature_name }}_repository.dart';

final {{ feature_name.camelCase() }}ViewModelProvider =
    StateNotifierProvider<{{ feature_name.pascalCase() }}ViewModel, {{ feature_name.pascalCase() }}State>(
  (ref) => {{ feature_name.pascalCase() }}ViewModel(
    repository: {{ feature_name.pascalCase() }}Repository(
      api: ref.read({{ feature_name.camelCase() }}ApiProvider),
    ),
  ),
);

class {{ feature_name.pascalCase() }}State {
  final bool isLoading;
  final String data;

  {{ feature_name.pascalCase() }}State({this.isLoading = false, this.data = ''});

  {{ feature_name.pascalCase() }}State copyWith({
    bool? isLoading,
    String? data,
  }) {
    return {{ feature_name.pascalCase() }}State(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }
}

class {{ feature_name.pascalCase() }}ViewModel extends StateNotifier<{{ feature_name.pascalCase() }}State> {
  final {{ feature_name.pascalCase() }}Repository repository;

  {{ feature_name.pascalCase() }}ViewModel({required this.repository})
      : super({{ feature_name.pascalCase() }}State());

  Future<void> loadData() async {
    state = state.copyWith(isLoading: true);
    // فراخوانی repository
    final result = await repository.getData();
    state = state.copyWith(isLoading: false, data: result.name);
  }
} 