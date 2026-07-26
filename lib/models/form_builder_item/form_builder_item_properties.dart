import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';

part 'form_builder_item_properties.g.dart';

abstract class FormBuilderItemProperties extends Equatable {}

@CopyWith()
final class FormBuilderItemPropertiesTextField extends FormBuilderItemProperties {
  final String? label;
  final String? hintText;
  final String? defaultValue;
  final bool? required;

  FormBuilderItemPropertiesTextField({this.label, this.hintText, this.defaultValue, this.required});

  @override
  List<Object?> get props => [label, hintText, defaultValue, required];

  @override
  bool get stringify => true;
}

@CopyWith()
final class FormBuilderItemPropertiesNumberField extends FormBuilderItemProperties {
  final String? label;
  final String? hintText;
  final String? defaultValue;
  final bool? required;

  FormBuilderItemPropertiesNumberField({this.label, this.hintText, this.defaultValue, this.required});

  @override
  List<Object?> get props => [label, hintText, defaultValue, required];

  @override
  bool get stringify => true;
}

@CopyWith()
final class FormBuilderItemPropertiesCheckboxField extends FormBuilderItemProperties {
  final String? label;
  final bool? defaultValue;
  final bool? required;

  FormBuilderItemPropertiesCheckboxField({this.label, this.defaultValue, this.required});

  @override
  List<Object?> get props => [label, defaultValue, required];

  @override
  bool get stringify => true;
}

@CopyWith()
final class FormBuilderItemPropertiesColumns extends FormBuilderItemProperties {
  final Map<String, List<FormBuilderItem>> columns;

  FormBuilderItemPropertiesColumns({required this.columns});
  @override
  List<Object?> get props => [columns];

  @override
  bool get stringify => true;
}

final class FormBuilderItemPropertiesHeader extends FormBuilderItemProperties {
  final String? heading;
  FormBuilderItemPropertiesHeader({this.heading});

  @override
  List<Object?> get props => [heading];

  @override
  bool get stringify => true;
}
