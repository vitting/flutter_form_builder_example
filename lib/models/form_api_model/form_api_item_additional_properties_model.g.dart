// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_api_item_additional_properties_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormApiItemAdditionalPropertiesModel
_$FormApiItemAdditionalPropertiesModelFromJson(Map<String, dynamic> json) =>
    FormApiItemAdditionalPropertiesModel(
      label: json['label'] as String?,
      required: json['required'] as bool?,
      placeholder: json['placeholder'] as String?,
      defaultValue: json['defaultValue'] as String?,
      columns: (json['columns'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>).map(
            (e) => FormApiItemModel.fromJson(e as Map<String, dynamic>),
          ),
        ),
      ),
    );

Map<String, dynamic> _$FormApiItemAdditionalPropertiesModelToJson(
  FormApiItemAdditionalPropertiesModel instance,
) => <String, dynamic>{
  'label': instance.label,
  'required': instance.required,
  'placeholder': instance.placeholder,
  'defaultValue': instance.defaultValue,
  'columns': instance.columns?.map(
    (k, e) => MapEntry(k, e.map((e) => e.toJson()).toList()),
  ),
};
