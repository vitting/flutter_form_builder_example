import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_item_additional_properties_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form_api_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FormApiItemModel extends Equatable {
  final ControlTypesEnum controlType;
  final String id;
  final String? parentContainerId;
  final String? columnId;
  final int? columnIndex;
  final FormApiItemAdditionalPropertiesModel? additionalProperties;

  const FormApiItemModel({
    required this.controlType,
    required this.id,
    this.parentContainerId,
    this.columnId,
    this.columnIndex,
    this.additionalProperties,
  });

  factory FormApiItemModel.fromJson(Map<String, dynamic> json) => _$FormApiItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$FormApiItemModelToJson(this);

  @override
  List<Object?> get props => [controlType, id, parentContainerId, columnId, columnIndex, additionalProperties];

  @override
  bool get stringify => true;
}
