import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/form_controls/form_text_field.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/drag_control.dart';

class MenuTextFieldControl extends StatelessWidget {
  final String label;
  final ControlTypesEnum controlType;
  final FormElementTypeEnum formElementType;
  const MenuTextFieldControl({super.key, required this.label, required this.controlType, required this.formElementType});

  @override
  Widget build(BuildContext context) {
    return DragControl(
      controlType: controlType,
      formElementType: formElementType,
      child: FormTextField(label: label),
    );
  }
}
