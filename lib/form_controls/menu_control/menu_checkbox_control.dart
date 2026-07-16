import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/form_controls/form_checkbox.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/drag_control.dart';

class MenuCheckboxControl extends StatelessWidget {
  const MenuCheckboxControl({super.key});

  @override
  Widget build(BuildContext context) {
    return DragControl(
      controlType: ControlTypesEnum.checkbox,
      formElementType: FormElementTypeEnum.input,
      child: FormCheckbox(label: 'Checkbox'),
    );
  }
}
