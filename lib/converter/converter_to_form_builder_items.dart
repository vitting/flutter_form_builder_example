import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_item_model.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

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

  static FormBuilderColumnsItem _convertColumnsItem(FormApiItemModel formApiItem) {
    final columns = formApiItem.additionalProperties?.columns ?? {};
    final convertedColumns = columns.map((columnId, columnItems) {
      final convertedColumnItems = convert(columnItems);
      return MapEntry(columnId, convertedColumnItems.toList());
    });
    return FormBuilderColumnsItem(id: formApiItem.id, controlType: formApiItem.controlType, columns: convertedColumns);
  }

  static FormBuilderInputItem _convertInputItem(FormApiItemModel formApiItem) {
    return FormBuilderInputItem(
      id: formApiItem.id,
      controlType: formApiItem.controlType,
      parentContainerId: formApiItem.parentContainerId,
      columnId: formApiItem.columnId,
      columnIndex: formApiItem.columnIndex,
      label: formApiItem.additionalProperties?.label,
    );
  }

  static FormBuilderHeadingItem _convertHeadingItem(FormApiItemModel formApiItem) {
    return FormBuilderHeadingItem(
      id: formApiItem.id,
      controlType: formApiItem.controlType,
      parentContainerId: formApiItem.parentContainerId,
      columnId: formApiItem.columnId,
      columnIndex: formApiItem.columnIndex,
      text: formApiItem.additionalProperties?.label ?? '',
    );
  }
}
