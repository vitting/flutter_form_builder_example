import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_state.dart';
import 'package:flutter_form_builder_example/drop_zone/drop_zone.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/form_builder/form_control_manage_container.dart';
import 'package:flutter_form_builder_example/form_builder/form_builder_columns.dart';
import 'package:flutter_form_builder_example/form_controls/form_checkbox.dart';
import 'package:flutter_form_builder_example/form_controls/form_heading.dart';
import 'package:flutter_form_builder_example/form_controls/form_text_field.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

class FormBuilder extends StatefulWidget {
  const FormBuilder({super.key});

  @override
  State<FormBuilder> createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  Widget _generateInput(FormBuilderItem item) {
    switch (item.controlType) {
      case ControlTypesEnum.textField:
        return FormControlManageContainer(
          onDelete: () {
            _onDeleteItem(context, item.id);
          },
          child: FormTextField(label: ControlTypesEnum.textField.name, isFormRenderControl: true, isEnabled: false),
        );

      case ControlTypesEnum.numberField:
        return FormControlManageContainer(
          onDelete: () {
            _onDeleteItem(context, item.id);
          },
          child: FormTextField(label: ControlTypesEnum.numberField.name, isFormRenderControl: true, isEnabled: false),
        );
      case ControlTypesEnum.checkbox:
        return FormControlManageContainer(
          onDelete: () {
            _onDeleteItem(context, item.id);
          },
          child: FormCheckbox(label: ControlTypesEnum.checkbox.name, isFormRenderControl: true, isEnabled: false),
        );
      case ControlTypesEnum.heading:
        return FormControlManageContainer(
          onDelete: () {
            _onDeleteItem(context, item.id);
          },
          child: FormHeading(text: 'Hello'),
        );
      default:
        return SizedBox.shrink();
    }
  }

  void _onDeleteItem(BuildContext context, String itemId) {
    BlocProvider.of<FormBuilderBloc>(context).add(RemoveFormBuilderItemEvent(itemId: itemId));
  }

  List<Widget> _buildFormControls(BuildContext context, {required List<FormBuilderItem> items, bool showDataZones = false}) {
    final List<Widget> formControls = [];

    for (var item in items) {
      switch (item) {
        case FormBuilderInputItem():
          formControls.add(_generateInput(item));
        case FormBuilderHeadingItem():
          formControls.add(_generateInput(item));
        case FormBuilderColumnsItem():
          formControls.add(
            FormBuilderColumns(
              showDataZones: showDataZones,
              parentContainerItem: item,
              buildFormControls: (columnId) {
                final columnItems = item.columns[columnId] ?? [];
                return _buildFormControls(context, items: columnItems, showDataZones: showDataZones);
              },
              onDelete: (itemIdToDelete) {
                _onDeleteItem(context, itemIdToDelete);
              },
            ),
          );

        default:
          break;
      }

      formControls.add(
        DropZone(
          parentId: item.id,
          isVisible: showDataZones,
          parentContainerId: item.parentContainerId,
          columnId: item.columnId,
          columnIndex: item.columnIndex,
        ),
      );
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropZone(showExpaned: items.isEmpty, isVisible: items.isEmpty || state.showDataZones),
              ..._buildFormControls(context, items: items, showDataZones: state.showDataZones),
            ],
          ),
        );
      },
    );
  }
}
