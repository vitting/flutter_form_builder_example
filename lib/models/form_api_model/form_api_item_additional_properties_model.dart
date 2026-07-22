import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form_api_item_additional_properties_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FormApiItemAdditionalPropertiesModel extends Equatable {
  final String? label;
  final bool? required;
  final String? placeholder;
  final String? defaultValue;
  final Map<String, Iterable<FormApiItemModel>>? columns;

  const FormApiItemAdditionalPropertiesModel({this.label, this.required, this.placeholder, this.defaultValue, this.columns});

  factory FormApiItemAdditionalPropertiesModel.fromJson(Map<String, dynamic> json) =>
      _$FormApiItemAdditionalPropertiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$FormApiItemAdditionalPropertiesModelToJson(this);

  @override
  List<Object?> get props => [label, required, placeholder, defaultValue, columns];

  @override
  bool get stringify => true;
}
