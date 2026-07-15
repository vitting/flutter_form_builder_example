import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/menu/menu.dart';
import 'package:flutter_form_builder_example/menu/menu_item_model.dart';
import 'package:flutter_form_builder_example/menu_checkbox.dart';
import 'package:flutter_form_builder_example/menu_text_field.dart';
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
      child: MenuTextField(label: 'TextField'),
    ),
    MenuItemModel(
      icon: Symbols.onetwothree_rounded,
      label: 'NumberFields',
      child: MenuTextField(label: 'NumberField'),
    ),
    MenuItemModel(icon: Symbols.check_box, label: 'Checkbox', child: MenuCheckbox()),
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
