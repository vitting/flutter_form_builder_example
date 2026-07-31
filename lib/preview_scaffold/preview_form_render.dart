import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/form_builder/form_builder_columns.dart';
import 'package:flutter_form_builder_example/form_controls/form_checkbox.dart';
import 'package:flutter_form_builder_example/form_controls/form_heading.dart';
import 'package:flutter_form_builder_example/form_controls/form_text_field.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item_properties.dart';

class PreviewFormRender extends StatelessWidget {
  final Iterable<FormBuilderItem<FormBuilderItemProperties>> items;
  const PreviewFormRender({super.key, required this.items});

  Widget _generateInput(FormBuilderItem item, int index) {
    switch (item.controlType) {
      case ControlTypesEnum.textField:
        final properties = item.getPropertiesAsTextField;
        return FormTextField(
          label: properties.label ?? '',
          isFormRenderControl: true,
          isEnabled: true,
          isRequired: properties.required ?? false,
        );

      case ControlTypesEnum.numberField:
        final properties = item.getPropertiesAsNumberField;
        return FormTextField(
          label: properties.label ?? '',
          isFormRenderControl: true,
          isEnabled: true,
          isRequired: properties.required ?? false,
        );
      case ControlTypesEnum.checkbox:
        final properties = item.getPropertiesAsCheckboxField;
        return FormCheckbox(
          label: properties.label ?? '',
          isFormRenderControl: true,
          isEnabled: true,
          initialValue: properties.defaultValue ?? false,
          isRequired: properties.required ?? false,
        );
      case ControlTypesEnum.heading:
        final properties = item.getPropertiesAsHeader;
        return FormHeading(text: properties.heading ?? '');
      default:
        return SizedBox.shrink();
    }
  }

  Widget _getControl(BuildContext context, FormBuilderItem item, int index) {
    return switch (item.controlType) {
      ControlTypesEnum.textField ||
      ControlTypesEnum.numberField ||
      ControlTypesEnum.checkbox ||
      ControlTypesEnum.heading => _generateInput(item, index),
      ControlTypesEnum.columns => FormBuilderColumns(
        excludeFormControlManagerContainer: true,
        index: index,
        parentContainerItem: item,
        buildFormControls: (columnId) {
          final columnItems = (item.properties as FormBuilderItemPropertiesColumns).columns[columnId] ?? [];
          return _buildFormControls(context, items: columnItems);
        },
      ),
      _ => throw UnimplementedError(),
    };
  }

  Widget _buildFormControls(BuildContext context, {required List<FormBuilderItem> items}) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = items[index];
        return Column(children: [_getControl(context, item, index)]);
      },
      itemCount: items.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildFormControls(context, items: items.toList())],
    );
  }
}
