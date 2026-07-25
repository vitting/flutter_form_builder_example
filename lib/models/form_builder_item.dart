import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_scaffold.dart';

part 'form_builder_item.g.dart';

@CopyWith()
final class FormBuilderItem<T extends FormBuilderItemProperties> extends Equatable {
  final String id;
  final ControlTypesEnum controlType;
  // Optional fields for parent container (ex. Columns) and column IDs
  final String? parentContainerId;
  // Optional field for column ID (used when the item is inside a column)
  final String? columnId;
  final int? columnIndex;
  final T? properties;

  const FormBuilderItem({
    required this.id,
    required this.controlType,
    this.parentContainerId,
    this.columnId,
    this.columnIndex,
    this.properties,
  });

  FormBuilderItem copyWithBaseFields({required String id, String? parentContainerId, String? columnId, int? columnIndex}) {
    return copyWith(id: id, parentContainerId: parentContainerId, columnId: columnId, columnIndex: columnIndex);
  }

  @override
  List<Object?> get props => [id, controlType, parentContainerId, columnId, columnIndex];

  MetaSidebarScaffoldFieldsToShow get metaSidebarScaffoldFieldsToShow => switch (controlType) {
    ControlTypesEnum.textField || ControlTypesEnum.numberField => (
      showDefaultValue: true,
      showDefaultValueTrueFalse: false,
      showLabel: true,
      showHeading: false,
      showHintText: true,
      showRequired: true,
    ),
    ControlTypesEnum.checkbox => (
      showDefaultValue: false,
      showDefaultValueTrueFalse: true,
      showLabel: true,
      showHeading: false,
      showHintText: false,
      showRequired: true,
    ),
    ControlTypesEnum.columns => (
      showDefaultValue: false,
      showDefaultValueTrueFalse: false,
      showLabel: false,
      showHeading: false,
      showHintText: false,
      showRequired: false,
    ),
    ControlTypesEnum.heading => (
      showDefaultValue: false,
      showDefaultValueTrueFalse: false,
      showLabel: false,
      showHeading: true,
      showHintText: false,
      showRequired: false,
    ),
    _ => (
      showDefaultValue: false,
      showDefaultValueTrueFalse: false,
      showLabel: false,
      showHeading: false,
      showHintText: false,
      showRequired: false,
    ),
  };

  FormElementTypeEnum get formElementType => switch (controlType) {
    ControlTypesEnum.textField => FormElementTypeEnum.simple,
    ControlTypesEnum.numberField => FormElementTypeEnum.simple,
    ControlTypesEnum.checkbox => FormElementTypeEnum.simple,
    ControlTypesEnum.columns => FormElementTypeEnum.column,
    ControlTypesEnum.heading => FormElementTypeEnum.simple,
    _ => throw UnsupportedError('Unsupported form element type'),
  };

  FormBuilderItemPropertiesTextField get getPropertiesAsTextField => properties as FormBuilderItemPropertiesTextField;

  FormBuilderItemPropertiesNumberField get getPropertiesAsNumberField => properties as FormBuilderItemPropertiesNumberField;

  FormBuilderItemPropertiesCheckboxField get getPropertiesAsCheckboxField => properties as FormBuilderItemPropertiesCheckboxField;

  FormBuilderItemPropertiesColumns get getPropertiesAsColumns => properties as FormBuilderItemPropertiesColumns;

  FormBuilderItemPropertiesHeader get getPropertiesAsHeader => properties as FormBuilderItemPropertiesHeader;
}

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
}

@CopyWith()
final class FormBuilderItemPropertiesCheckboxField extends FormBuilderItemProperties {
  final String? label;
  final bool? defaultValue;
  final bool? required;

  FormBuilderItemPropertiesCheckboxField({this.label, this.defaultValue, this.required});

  @override
  List<Object?> get props => [label, defaultValue, required];
}

@CopyWith()
final class FormBuilderItemPropertiesColumns extends FormBuilderItemProperties {
  final Map<String, List<FormBuilderItem>> columns;

  FormBuilderItemPropertiesColumns({required this.columns});
  @override
  List<Object?> get props => [columns];
}

final class FormBuilderItemPropertiesHeader extends FormBuilderItemProperties {
  final String? header;
  FormBuilderItemPropertiesHeader({this.header});

  @override
  List<Object?> get props => [header];
}
