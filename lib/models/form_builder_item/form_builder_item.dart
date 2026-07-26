import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_controls_to_show_model.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_results_model.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item_properties.dart';
import 'package:string_extensions/string_extensions.dart';

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
  List<Object?> get props => [id, controlType, parentContainerId, columnId, columnIndex, properties];

  @override
  bool get stringify => true;

  MetaSidebarResultsModel get propertiesAsMetaSidebarScaffoldResultsModel => switch (controlType) {
    ControlTypesEnum.textField => MetaSidebarResultsModel(
      item: this,
      label: getPropertiesAsTextField.label,
      hintText: getPropertiesAsTextField.hintText,
      defaultValue: getPropertiesAsTextField.defaultValue,
      required: getPropertiesAsTextField.required,
    ),
    ControlTypesEnum.numberField => MetaSidebarResultsModel(
      item: this,
      label: getPropertiesAsNumberField.label,
      hintText: getPropertiesAsNumberField.hintText,
      defaultValue: getPropertiesAsNumberField.defaultValue,
      required: getPropertiesAsNumberField.required,
    ),
    ControlTypesEnum.checkbox => MetaSidebarResultsModel(
      item: this,
      label: getPropertiesAsCheckboxField.label,
      defaultValueTrueFalse: getPropertiesAsCheckboxField.defaultValue,
      required: getPropertiesAsCheckboxField.required,
    ),
    ControlTypesEnum.columns => MetaSidebarResultsModel(item: this),
    ControlTypesEnum.heading => MetaSidebarResultsModel(item: this, heading: getPropertiesAsHeader.heading),
    _ => throw UnsupportedError(
      'propertiesAsMetaSidebarScaffoldResultsModel: Unsupported form item control type for meta sidebar scaffold results model: $controlType',
    ),
  };

  MetaSidebarControlsToShowModel get metaSidebarScaffoldFieldsToShow => switch (controlType) {
    ControlTypesEnum.textField || ControlTypesEnum.numberField => MetaSidebarControlsToShowModel(
      showDefaultValue: true,
      showDefaultValueTrueFalse: false,
      showLabel: true,
      showHeading: false,
      showHintText: true,
      showRequired: true,
    ),
    ControlTypesEnum.checkbox => MetaSidebarControlsToShowModel(
      showDefaultValue: false,
      showDefaultValueTrueFalse: true,
      showLabel: true,
      showHeading: false,
      showHintText: false,
      showRequired: true,
    ),
    ControlTypesEnum.columns => MetaSidebarControlsToShowModel(
      showDefaultValue: false,
      showDefaultValueTrueFalse: false,
      showLabel: false,
      showHeading: false,
      showHintText: false,
      showRequired: false,
    ),
    ControlTypesEnum.heading => MetaSidebarControlsToShowModel(
      showDefaultValue: false,
      showDefaultValueTrueFalse: false,
      showLabel: false,
      showHeading: true,
      showHintText: false,
      showRequired: false,
    ),
    _ => MetaSidebarControlsToShowModel(
      showDefaultValue: false,
      showDefaultValueTrueFalse: false,
      showLabel: false,
      showHeading: false,
      showHintText: false,
      showRequired: false,
    ),
  };

  String get previewLabelForItem {
    return switch (controlType) {
      ControlTypesEnum.textField || ControlTypesEnum.numberField || ControlTypesEnum.checkbox => 'Input',
      ControlTypesEnum.columns => 'Columns',
      ControlTypesEnum.heading => 'Heading',
      _ => throw UnsupportedError('Unsupported form item control type: $controlType'),
    };
  }

  FormElementTypeEnum get formElementType => switch (controlType) {
    ControlTypesEnum.textField => FormElementTypeEnum.simple,
    ControlTypesEnum.numberField => FormElementTypeEnum.simple,
    ControlTypesEnum.checkbox => FormElementTypeEnum.simple,
    ControlTypesEnum.columns => FormElementTypeEnum.column,
    ControlTypesEnum.heading => FormElementTypeEnum.simple,
    _ => throw UnsupportedError('Unsupported form element type'),
  };

  String get controlTypeAsString => controlType.name.toTitleCase();

  FormBuilderItemPropertiesTextField get getPropertiesAsTextField => properties as FormBuilderItemPropertiesTextField;

  FormBuilderItemPropertiesNumberField get getPropertiesAsNumberField => properties as FormBuilderItemPropertiesNumberField;

  FormBuilderItemPropertiesCheckboxField get getPropertiesAsCheckboxField => properties as FormBuilderItemPropertiesCheckboxField;

  FormBuilderItemPropertiesColumns get getPropertiesAsColumns => properties as FormBuilderItemPropertiesColumns;

  FormBuilderItemPropertiesHeader get getPropertiesAsHeader => properties as FormBuilderItemPropertiesHeader;
}
