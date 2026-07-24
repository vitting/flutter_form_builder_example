import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_reorder_cubit/form_builder_reorder_cubit.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/menu_checkbox_control.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/menu_columns_control.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/menu_heading_control.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/menu_text_field_control.dart';
import 'package:flutter_form_builder_example/get_it/injection.dart';
import 'package:flutter_form_builder_example/menu/menu.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_controller.dart';
import 'package:flutter_form_builder_example/models/menu_item_header_model.dart';
import 'package:flutter_form_builder_example/models/menu_item_model.dart';
import 'package:flutter_form_builder_example/models/menu_model.dart';
import 'package:flutter_form_builder_example/repositories/form_render_builder_repository.dart';
import 'package:flutter_form_builder_example/sidebar/sidebar.dart';
import 'package:flutter_form_builder_example/sidebar/sidebar_controller.dart';
import 'package:flutter_form_builder_example/topbar.dart';
import 'package:material_symbols_icons/symbols.dart';

final sidebarController = SidebarController();
final metaSidebarController = MetaSidebarController();

class WebScaffold extends StatelessWidget {
  final Widget content;
  const WebScaffold({super.key, required this.content});

  List<MenuModel> get _menuItems => [
    MenuItemHeaderModel(label: 'Inputs'),
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
    MenuItemHeaderModel(label: 'Layouts'),
    MenuItemModel(icon: Symbols.view_column_2, label: 'Column', child: MenuColumnsControl()),
    MenuItemModel(icon: Symbols.format_h1, label: 'Overskrift', child: MenuHeadingControl()),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FormBuilderReorderCubit()),
        BlocProvider(create: (context) => FormBuilderBloc(getIt<FormRenderBuilderRepository>())),
      ],
      child: Scaffold(
        body: Column(
          children: [
            Topbar(),
            Expanded(
              child: Row(
                children: [
                  Menu(menuItems: _menuItems),
                  Expanded(
                    child: Sidebar(controller: sidebarController, child: content),
                  ),
                  MetaSidebar(controller: metaSidebarController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
