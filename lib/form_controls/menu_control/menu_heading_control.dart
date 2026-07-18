import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/form_controls/form_heading.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/drag_control.dart';

class MenuHeadingControl extends StatelessWidget {
  const MenuHeadingControl({super.key});

  @override
  Widget build(BuildContext context) {
    return DragControl(
      controlType: ControlTypesEnum.heading,
      formElementType: FormElementTypeEnum.layout,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: 40,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [FormHeading(text: 'Overskrift', textColor: Colors.white)],
          ),
        ),
      ),
    );
  }
}
