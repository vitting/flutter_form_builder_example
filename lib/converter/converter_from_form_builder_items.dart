import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_item_additional_properties_model.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_item_model.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_model.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

class ConverterFromFormBuilderItems {
  static FormApiModel convert(String id, String name, Iterable<FormBuilderItem> formBuilderItems) {
    final formApiItems = _convertFormBuilderItemsToFormApiItems(formBuilderItems);
    return FormApiModel(id: id, name: name, fields: formApiItems);
  }

  static Iterable<FormApiItemModel> _convertFormBuilderItemsToFormApiItems(Iterable<FormBuilderItem> formBuilderItems) {
    return formBuilderItems.map(
      (formBuilderItem) => switch (formBuilderItem.controlType) {
        ControlTypesEnum.columns => _convertColumnsItem(formBuilderItem),
        ControlTypesEnum.heading => _convertHeadingItem(formBuilderItem),
        ControlTypesEnum.textField ||
        ControlTypesEnum.numberField ||
        ControlTypesEnum.checkbox => _convertInputItem(formBuilderItem),
        _ => throw Exception('Unsupported FormBuilderItem type: ${formBuilderItem.runtimeType}'),
      },
    );
  }

  static FormApiItemModel _convertColumnsItem(FormBuilderItem columnsItem) {
    final convertedColumns = (columnsItem.properties as FormBuilderItemPropertiesColumns).columns.map((columnId, columnItems) {
      final convertedColumnItems = _convertFormBuilderItemsToFormApiItems(columnItems);
      return MapEntry(columnId, convertedColumnItems.toList());
    });
    return FormApiItemModel(
      id: columnsItem.id,
      controlType: columnsItem.controlType,
      additionalProperties: FormApiItemAdditionalPropertiesModel(columns: convertedColumns),
    );
  }

  static FormApiItemModel _convertInputItem(FormBuilderItem inputItem) {
    return FormApiItemModel(
      id: inputItem.id,
      controlType: inputItem.controlType,
      parentContainerId: inputItem.parentContainerId,
      columnId: inputItem.columnId,
      columnIndex: inputItem.columnIndex,
    );
  }

  static FormApiItemModel _convertHeadingItem(FormBuilderItem headingItem) {
    return FormApiItemModel(
      id: headingItem.id,
      controlType: headingItem.controlType,
      parentContainerId: headingItem.parentContainerId,
      columnId: headingItem.columnId,
      columnIndex: headingItem.columnIndex,
      additionalProperties: FormApiItemAdditionalPropertiesModel(
        label: (headingItem.properties as FormBuilderItemPropertiesHeader).header,
      ),
    );
  }
}
