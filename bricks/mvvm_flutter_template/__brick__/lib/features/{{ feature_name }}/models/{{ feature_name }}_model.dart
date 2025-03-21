// مدل اختصاصی ماژول (در صورت نیاز به تغییر نسبت به data/models)
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{ feature_name }}_model.freezed.dart';
part '{{ feature_name }}_model.g.dart';

@freezed
class {{ feature_name.pascalCase() }}Model with _${{ feature_name.pascalCase() }}Model {
  const factory {{ feature_name.pascalCase() }}Model({
    required int id,
    required String name,
    {% if json_schema != "" %}
    // فیلدهای اضافی از JSON Schema
    {{ json_schema }}
    {% endif %}
  }) = _{{ feature_name.pascalCase() }}Model;

  factory {{ feature_name.pascalCase() }}Model.fromJson(Map<String, dynamic> json) =>
      _${{ feature_name.pascalCase() }}ModelFromJson(json);
} 