// پیاده‌سازی repository مربوط به ویژگی مورد نظر
import '../../features/{{ feature_name }}/models/{{ feature_name }}_model.dart';
import '../providers/{{ feature_name }}_api_provider.dart';

class {{ feature_name.pascalCase() }}Repository {
  final {{ feature_name.pascalCase() }}Api api;

  {{ feature_name.pascalCase() }}Repository({required this.api});

  Future<{{ feature_name.pascalCase() }}Model> getData() async {
    // فراخوانی API و تبدیل داده‌ها به مدل
    await api.fetchData();
    // اینجا می‌توانید از داده‌های واقعی استفاده کنید
    return {{ feature_name.pascalCase() }}Model(id: 1, name: 'Sample');
  }
} 