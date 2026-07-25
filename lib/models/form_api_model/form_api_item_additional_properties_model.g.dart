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
      hintText: json['hintText'] as String?,
      defaultValue: json['defaultValue'] as String?,
      columns: (json['columns'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>).map(
            (e) => FormApiItemModel.fromJson(e as Map<String, dynamic>),
          ),
        ),
      ),
      defaultValueTrueFalse: json['defaultValueTrueFalse'] as bool?,
    );

Map<String, dynamic> _$FormApiItemAdditionalPropertiesModelToJson(
  FormApiItemAdditionalPropertiesModel instance,
) => <String, dynamic>{
  'label': instance.label,
  'required': instance.required,
  'hintText': instance.hintText,
  'defaultValue': instance.defaultValue,
  'defaultValueTrueFalse': instance.defaultValueTrueFalse,
  'columns': instance.columns?.map(
    (k, e) => MapEntry(k, e.map((e) => e.toJson()).toList()),
  ),
};
