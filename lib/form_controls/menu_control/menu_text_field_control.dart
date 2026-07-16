import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/form_controls/form_text_field.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/drag_container.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

class MenuTextFieldControl extends StatelessWidget {
  final String label;
  final ControlTypesEnum controlType;
  final FormElementTypeEnum formElementType;
  const MenuTextFieldControl({super.key, required this.label, required this.controlType, required this.formElementType});

  @override
  Widget build(BuildContext context) {
    return Draggable<FormBuilderItem>(
      data: FormBuilderItem(id: '', controlType: controlType, formElementType: formElementType),
      feedback: DragContainer(isDragging: true, child: FormTextField(label: label)),
      childWhenDragging: DragContainer(isDragging: true, child: FormTextField(label: label)),
      child: FormTextField(label: label),
    );
  }
}
