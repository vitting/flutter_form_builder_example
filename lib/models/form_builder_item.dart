import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_scaffold.dart';

part 'form_builder_item.g.dart';

abstract class FormBuilderItem extends Equatable {
  final String id;
  final ControlTypesEnum controlType;
  // Optional fields for parent container (ex. Columns) and column IDs
  final String? parentContainerId;
  // Optional field for column ID (used when the item is inside a column)
  final String? columnId;
  final int? columnIndex;

  const FormBuilderItem({required this.id, required this.controlType, this.parentContainerId, this.columnId, this.columnIndex});

  FormBuilderItem copyWithBaseFields({required String id, String? parentContainerId, String? columnId, int? columnIndex});

  @override
  List<Object?> get props => [id, controlType, parentContainerId, columnId, columnIndex];

  MetaSidebarScaffoldFieldsToShow get metaSidebarScaffoldFieldsToShow;

  /// Returns the correct subtype of FormBuilderItem
  T getAsType<T extends FormBuilderItem>() {
    if (this is! T) {
      throw Exception('FormBuilderItem is not of type $T');
    }

    return this as T;
  }

  /// Returns as FormBuilderInputItem if this is an input, otherwise null
  FormBuilderInputItem? asInputItem() => this is FormBuilderInputItem ? this as FormBuilderInputItem : null;

  /// Returns as FormBuilderColumnsItem if this is a columns layout, otherwise null
  FormBuilderColumnsItem? asColumnsItem() => this is FormBuilderColumnsItem ? this as FormBuilderColumnsItem : null;

  /// Returns as FormBuilderHeadingItem if this is a heading, otherwise null
  FormBuilderHeadingItem? asHeadingItem() => this is FormBuilderHeadingItem ? this as FormBuilderHeadingItem : null;
}

@CopyWith()
final class FormBuilderInputItem extends FormBuilderItem {
  final String? label;
  final String? hintText;
  final String? defaultValue;

  const FormBuilderInputItem({
    required super.id,
    required super.controlType,
    super.parentContainerId,
    super.columnId,
    super.columnIndex,
    this.label,
    this.hintText,
    this.defaultValue,
  });

  @override
  List<Object?> get props => [id, controlType, parentContainerId, columnId, columnIndex, label, hintText, defaultValue];

  @override
  bool get stringify => true;

  FormElementTypeEnum get formElementType => FormElementTypeEnum.input;

  @override
  FormBuilderInputItem copyWithBaseFields({required String id, String? parentContainerId, String? columnId, int? columnIndex}) {
    return copyWith(id: id, parentContainerId: parentContainerId, columnId: columnId, columnIndex: columnIndex);
  }

  @override
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
    _ => (
      showDefaultValue: false,
      showDefaultValueTrueFalse: false,
      showLabel: false,
      showHeading: false,
      showHintText: false,
      showRequired: false,
    ),
  };
}

@CopyWith()
final class FormBuilderColumnsItem extends FormBuilderItem {
  final Map<String, List<FormBuilderItem>> columns;
  const FormBuilderColumnsItem({
    required super.id,
    required super.controlType,
    required this.columns,
    super.parentContainerId,
    super.columnId,
    super.columnIndex,
  });

  @override
  List<Object?> get props => [id, controlType, formElementType, columns, parentContainerId, columnId, columnIndex];

  @override
  bool get stringify => true;

  FormElementTypeEnum get formElementType => FormElementTypeEnum.layout;

  @override
  FormBuilderColumnsItem copyWithBaseFields({required String id, String? parentContainerId, String? columnId, int? columnIndex}) {
    return copyWith(id: id, parentContainerId: parentContainerId, columnId: columnId, columnIndex: columnIndex);
  }

  @override
  MetaSidebarScaffoldFieldsToShow get metaSidebarScaffoldFieldsToShow => (
    showDefaultValue: false,
    showDefaultValueTrueFalse: false,
    showLabel: false,
    showHeading: false,
    showHintText: false,
    showRequired: false,
  );
}

@CopyWith()
final class FormBuilderHeadingItem extends FormBuilderItem {
  final String text;
  const FormBuilderHeadingItem({
    required super.id,
    required super.controlType,
    super.parentContainerId,
    super.columnId,
    super.columnIndex,
    required this.text,
  });

  @override
  List<Object?> get props => [id, controlType, formElementType, text, parentContainerId, columnId, columnIndex];

  @override
  bool get stringify => true;

  FormElementTypeEnum get formElementType => FormElementTypeEnum.layout;

  @override
  FormBuilderHeadingItem copyWithBaseFields({required String id, String? parentContainerId, String? columnId, int? columnIndex}) {
    return copyWith(id: id, parentContainerId: parentContainerId, columnId: columnId, columnIndex: columnIndex);
  }

  @override
  MetaSidebarScaffoldFieldsToShow get metaSidebarScaffoldFieldsToShow => (
    showDefaultValue: false,
    showDefaultValueTrueFalse: false,
    showLabel: false,
    showHeading: true,
    showHintText: false,
    showRequired: false,
  );
}
