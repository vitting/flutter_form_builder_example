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
      (formBuilderItem) => switch (formBuilderItem) {
        FormBuilderColumnsItem columnsItem => _convertColumnsItem(columnsItem),
        FormBuilderHeadingItem headingItem => _convertHeadingItem(headingItem),
        FormBuilderInputItem inputItem => _convertInputItem(inputItem),
        _ => throw Exception('Unsupported FormBuilderItem type: ${formBuilderItem.runtimeType}'),
      },
    );
  }

  static FormApiItemModel _convertColumnsItem(FormBuilderColumnsItem columnsItem) {
    final convertedColumns = columnsItem.columns.map((columnId, columnItems) {
      final convertedColumnItems = _convertFormBuilderItemsToFormApiItems(columnItems);
      return MapEntry(columnId, convertedColumnItems.toList());
    });
    return FormApiItemModel(
      id: columnsItem.id,
      controlType: columnsItem.controlType,
      additionalProperties: FormApiItemAdditionalPropertiesModel(columns: convertedColumns),
    );
  }

  static FormApiItemModel _convertInputItem(FormBuilderInputItem inputItem) {
    return FormApiItemModel(
      id: inputItem.id,
      controlType: inputItem.controlType,
      parentContainerId: inputItem.parentContainerId,
      columnId: inputItem.columnId,
      columnIndex: inputItem.columnIndex,
    );
  }

  static FormApiItemModel _convertHeadingItem(FormBuilderHeadingItem headingItem) {
    return FormApiItemModel(
      id: headingItem.id,
      controlType: headingItem.controlType,
      parentContainerId: headingItem.parentContainerId,
      columnId: headingItem.columnId,
      columnIndex: headingItem.columnIndex,
      additionalProperties: FormApiItemAdditionalPropertiesModel(label: headingItem.text),
    );
  }
}
