// صفحه اصلی ویژگی
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/{{ feature_name }}_viewmodel.dart';

class {{ feature_name.pascalCase() }}View extends ConsumerWidget {
  const {{ feature_name.pascalCase() }}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch({{ feature_name.camelCase() }}ViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('{{ feature_name.pascalCase() }}'),
      ),
      body: Center(
        child: viewModel.isLoading
            ? const CircularProgressIndicator()
            : Text('Data: ${viewModel.data?.name ?? "No data"}'),
      ),
    );
  }
} 