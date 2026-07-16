import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/menu_checkbox_control.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/menu_text_field_control.dart';
import 'package:flutter_form_builder_example/menu/menu.dart';
import 'package:flutter_form_builder_example/models/menu_item_model.dart';
import 'package:flutter_form_builder_example/sidebar/sidebar.dart';
import 'package:flutter_form_builder_example/sidebar/sidebar_controller.dart';
import 'package:flutter_form_builder_example/topbar.dart';
import 'package:material_symbols_icons/symbols.dart';

final sidebarController = SidebarController();

class WebScaffold extends StatelessWidget {
  final Widget content;
  const WebScaffold({super.key, required this.content});

  List<MenuItemModel> get _menuItems => [
    MenuItemModel(
      icon: Symbols.text_fields,
      label: 'TestField',
      child: MenuTextFieldControl(
        label: 'TextField',
        controlType: ControlTypesEnum.textField,
        formElementType: FormElementTypeEnum.input,
      ),
    ),
    MenuItemModel(
      icon: Symbols.onetwothree_rounded,
      label: 'NumberFields',
      child: MenuTextFieldControl(
        label: 'NumberField',
        controlType: ControlTypesEnum.numberField,
        formElementType: FormElementTypeEnum.input,
      ),
    ),
    MenuItemModel(icon: Symbols.check_box, label: 'Checkbox', child: MenuCheckboxControl()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Topbar(),
          Expanded(
            child: Row(
              children: [
                Menu(menuItems: _menuItems),
                Expanded(
                  child: Sidebar(
                    controller: sidebarController,
                    child: Column(children: [Expanded(child: content)]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
