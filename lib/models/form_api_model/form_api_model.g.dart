// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormApiModel _$FormApiModelFromJson(Map<String, dynamic> json) => FormApiModel(
  id: json['id'] as String,
  name: json['name'] as String,
  fields: (json['fields'] as List<dynamic>).map(
    (e) => FormApiItemModel.fromJson(e as Map<String, dynamic>),
  ),
);

Map<String, dynamic> _$FormApiModelToJson(FormApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
    };
