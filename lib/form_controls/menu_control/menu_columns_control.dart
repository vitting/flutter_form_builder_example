import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/drag_control.dart';

class MenuColumnsControl extends StatelessWidget {
  const MenuColumnsControl({super.key});

  @override
  Widget build(BuildContext context) {
    return DragControl(
      controlType: ControlTypesEnum.columns,
      formElementType: FormElementTypeEnum.column,
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(border: Border.all(color: Colors.white)),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Column 1', style: TextStyle(color: Colors.white))],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white),
                    right: BorderSide(color: Colors.white),
                    top: BorderSide(color: Colors.white),
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Column 2', style: TextStyle(color: Colors.white))],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
