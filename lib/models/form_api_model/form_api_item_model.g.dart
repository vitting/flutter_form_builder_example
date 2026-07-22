// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_api_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormApiItemModel _$FormApiItemModelFromJson(Map<String, dynamic> json) =>
    FormApiItemModel(
      controlType: $enumDecode(_$ControlTypesEnumEnumMap, json['controlType']),
      id: json['id'] as String,
      parentContainerId: json['parentContainerId'] as String?,
      columnId: json['columnId'] as String?,
      columnIndex: (json['columnIndex'] as num?)?.toInt(),
      additionalProperties: json['additionalProperties'] == null
          ? null
          : FormApiItemAdditionalPropertiesModel.fromJson(
              json['additionalProperties'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FormApiItemModelToJson(FormApiItemModel instance) =>
    <String, dynamic>{
      'controlType': _$ControlTypesEnumEnumMap[instance.controlType]!,
      'id': instance.id,
      'parentContainerId': instance.parentContainerId,
      'columnId': instance.columnId,
      'columnIndex': instance.columnIndex,
      'additionalProperties': instance.additionalProperties?.toJson(),
    };

const _$ControlTypesEnumEnumMap = {
  ControlTypesEnum.textField: 'textField',
  ControlTypesEnum.numberField: 'numberField',
  ControlTypesEnum.dropDown: 'dropDown',
  ControlTypesEnum.checkbox: 'checkbox',
  ControlTypesEnum.radioButton: 'radioButton',
  ControlTypesEnum.columns: 'columns',
  ControlTypesEnum.heading: 'heading',
};
