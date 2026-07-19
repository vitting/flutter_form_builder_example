import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';

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

  @override
  List<Object?> get props => [id, controlType, parentContainerId, columnId, columnIndex];
}

@CopyWith()
final class FormBuilderInputItem extends FormBuilderItem {
  const FormBuilderInputItem({
    required super.id,
    required super.controlType,
    super.parentContainerId,
    super.columnId,
    super.columnIndex,
  });

  @override
  List<Object?> get props => [id, controlType, parentContainerId, columnId, columnIndex];

  @override
  bool get stringify => true;

  FormElementTypeEnum get formElementType => FormElementTypeEnum.input;
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
}
