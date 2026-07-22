import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form_api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FormApiModel extends Equatable {
  final String id;
  final String name;
  final Iterable<FormApiItemModel> fields;

  const FormApiModel({required this.id, required this.name, required this.fields});

  factory FormApiModel.fromJson(Map<String, dynamic> json) => _$FormApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$FormApiModelToJson(this);

  @override
  List<Object?> get props => [id, name, fields];

  @override
  bool get stringify => true;
}
