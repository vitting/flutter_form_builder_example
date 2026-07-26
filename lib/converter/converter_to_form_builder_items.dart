import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_item_model.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item_properties.dart';

class ConverterToFormBuilderItems {
  static Iterable<FormBuilderItem> convert(Iterable<FormApiItemModel> formApiItems) {
    return formApiItems.map(
      (formApiItem) => switch (formApiItem.controlType) {
        ControlTypesEnum.columns => _convertColumnsItem(formApiItem),
        ControlTypesEnum.heading => _convertHeadingItem(formApiItem),
        _ => _convertInputItem(formApiItem),
      },
    );
  }

  static FormBuilderItem _convertColumnsItem(FormApiItemModel formApiItem) {
    final columns = formApiItem.additionalProperties?.columns ?? {};
    final convertedColumns = columns.map((columnId, columnItems) {
      final convertedColumnItems = convert(columnItems);
      return MapEntry(columnId, convertedColumnItems.toList());
    });
    return FormBuilderItem(
      id: formApiItem.id,
      controlType: formApiItem.controlType,
      properties: FormBuilderItemPropertiesColumns(columns: convertedColumns),
    );
  }

  static FormBuilderItem _convertInputItem(FormApiItemModel formApiItem) {
    return FormBuilderItem(
      id: formApiItem.id,
      controlType: formApiItem.controlType,
      parentContainerId: formApiItem.parentContainerId,
      columnId: formApiItem.columnId,
      columnIndex: formApiItem.columnIndex,
      properties: _getGenericPropertiesForControlType(formApiItem),
    );
  }

  static FormBuilderItem _convertHeadingItem(FormApiItemModel formApiItem) {
    return FormBuilderItem(
      id: formApiItem.id,
      controlType: formApiItem.controlType,
      parentContainerId: formApiItem.parentContainerId,
      columnId: formApiItem.columnId,
      columnIndex: formApiItem.columnIndex,
      properties: FormBuilderItemPropertiesHeader(heading: formApiItem.additionalProperties?.label ?? ''),
    );
  }

  static FormBuilderItemProperties _getGenericPropertiesForControlType(FormApiItemModel formApiItem) {
    switch (formApiItem.controlType) {
      case ControlTypesEnum.textField:
        return FormBuilderItemPropertiesTextField(
          label: formApiItem.additionalProperties?.label ?? '',
          defaultValue: formApiItem.additionalProperties?.defaultValue,
          required: formApiItem.additionalProperties?.required ?? false,
        );
      case ControlTypesEnum.numberField:
        return FormBuilderItemPropertiesNumberField(
          label: formApiItem.additionalProperties?.label ?? '',
          defaultValue: formApiItem.additionalProperties?.defaultValue,
          required: formApiItem.additionalProperties?.required ?? false,
        );
      case ControlTypesEnum.checkbox:
        return FormBuilderItemPropertiesCheckboxField(
          label: formApiItem.additionalProperties?.label ?? '',
          defaultValue: formApiItem.additionalProperties?.defaultValueTrueFalse ?? false,
          required: formApiItem.additionalProperties?.required ?? false,
        );
      default:
        throw Exception('Unsupported control type: $formApiItem.controlType');
    }
  }
}
