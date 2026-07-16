import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';

part 'form_builder_item.g.dart';

@CopyWith()
class FormBuilderItem extends Equatable {
  final String id;
  final ControlTypesEnum controlType;
  final FormElementTypeEnum formElementType;
  final List<FormBuilderItem> children;
  const FormBuilderItem({required this.id, required this.controlType, required this.formElementType, this.children = const []});

  @override
  List<Object?> get props => [id, controlType, formElementType, children];

  @override
  bool get stringify => true;
}
