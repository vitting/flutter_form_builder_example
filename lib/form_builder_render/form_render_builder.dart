import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_state.dart';
import 'package:flutter_form_builder_example/drop_zone/drop_zone.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/form_builder_render/form_control_manage_container.dart';
import 'package:flutter_form_builder_example/form_controls/form_checkbox.dart';
import 'package:flutter_form_builder_example/form_controls/form_text_field.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

class FormRenderBuilder extends StatefulWidget {
  const FormRenderBuilder({super.key});

  @override
  State<FormRenderBuilder> createState() => _FormRenderBuilderState();
}

class _FormRenderBuilderState extends State<FormRenderBuilder> {
  void _onDeleteItem(BuildContext context, String itemId) {
    BlocProvider.of<FormBuilderBloc>(context).add(RemoveFormBuilderItemEvent(itemId: itemId));
  }

  List<Widget> _buildFormControls(BuildContext context, List<FormBuilderItem> items, {bool showDataZones = false}) {
    final List<Widget> formControls = [];

    for (var item in items) {
      switch (item.controlType) {
        case ControlTypesEnum.textField:
          formControls.add(
            FormControlManageContainer(
              onDelete: () {
                _onDeleteItem(context, item.id);
              },
              child: FormTextField(label: ControlTypesEnum.textField.name, isFormRenderControl: true, isEnabled: false),
            ),
          );
        case ControlTypesEnum.numberField:
          formControls.add(
            FormControlManageContainer(
              onDelete: () {
                _onDeleteItem(context, item.id);
              },
              child: FormTextField(label: ControlTypesEnum.numberField.name, isFormRenderControl: true, isEnabled: false),
            ),
          );
        case ControlTypesEnum.checkbox:
          formControls.add(
            FormControlManageContainer(
              onDelete: () {
                _onDeleteItem(context, item.id);
              },
              child: FormCheckbox(label: ControlTypesEnum.checkbox.name, isFormRenderControl: true, isEnabled: false),
            ),
          );
        default:
          break;
      }

      formControls.add(DropZone(parentId: item.id, isVisible: showDataZones));
    }

    return formControls;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBuilderBloc, FormBuilderState>(
      builder: (context, state) {
        final items = state.items;

        return SingleChildScrollView(
          child: Column(
            children: [
              DropZone(showExpaned: items.isEmpty, isVisible: items.isEmpty || state.showDataZones),
              ..._buildFormControls(context, items, showDataZones: state.showDataZones),
            ],
          ),
        );
      },
    );
  }
}
