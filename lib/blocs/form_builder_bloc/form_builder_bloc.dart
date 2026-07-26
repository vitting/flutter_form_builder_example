import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_state.dart';
import 'package:flutter_form_builder_example/converter/converter_to_form_builder_items.dart';
import 'package:flutter_form_builder_example/converter/form_api_example.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item_properties.dart';
import 'package:flutter_form_builder_example/repositories/form_render_builder_repository.dart';
import 'package:uuid/uuid.dart';

part 'form_builder_event.dart';

class FormBuilderBloc extends Bloc<FormBuilderEvent, FormBuilderState> {
  final FormRenderBuilderRepository _formRenderBuilderRepository;
  late final StreamSubscription<bool> _formRenderBuilderRepositoryStream;
  FormBuilderBloc(this._formRenderBuilderRepository) : super(FormBuilderState(items: [])) {
    on<AddFormBuilderItemEvent>(_onAddFormBuilderItemEventEvent);
    on<AddSimpleFormBuilderItemEvent>(_onAddSimpleFormBuilderItemEvent);
    on<AddSimpleFormBuilderItemIntoColumnEvent>(_onAddSimpleFormBuilderItemIntoColumnEvent);
    on<AddFormBuilderLayoutColumnItemEvent>(_onAddFormBuilderLayoutColumnItemEvent);
    on<RemoveFormBuilderItemEvent>(_onRemoveFormBuilderItemEvent);
    on<ShowFormBuilderDataZonesEvent>(_onShowFormBuilderDataZonesEvent);
    on<HideFormBuilderDataZonesEvent>(_onHideFormBuilderDataZonesEvent);
    on<ReorderFormBuilderItemEvent>(_onReorderFormBuilderItemEvent);
    on<FetchFormApiModelEvent>(_onFetchFormApiModelEvent);
    on<UpdateFormItemValuesEvent>(_onUpdateFormItemValuesEvent);

    _formRenderBuilderRepositoryStream = _formRenderBuilderRepository.dataStream.listen((showDataZones) {
      if (showDataZones) {
        add(ShowFormBuilderDataZonesEvent());
      } else {
        add(HideFormBuilderDataZonesEvent());
      }
    });
  }

  FutureOr<void> _onAddFormBuilderItemEventEvent(AddFormBuilderItemEvent event, Emitter<FormBuilderState> emit) {
    switch (event.item.formElementType) {
      case FormElementTypeEnum.simple:
        _addSimpleFormBuilderItem(event);
        break;
      case FormElementTypeEnum.column:
        add(
          AddFormBuilderLayoutColumnItemEvent(
            item: event.item,
            parentId: event.parentId,
            parentContainerId: event.parentContainerId,
            columnId: event.columnId,
            columnIndex: event.columnIndex,
          ),
        );
        break;
    }
  }

  void _addSimpleFormBuilderItem(AddFormBuilderItemEvent event) {
    // Add input item to column if parentContainerId and columnId are provided, otherwise add to root
    if (_checkIfParametersForColumnIsValid(event.parentContainerId, event.columnId)) {
      add(
        AddSimpleFormBuilderItemIntoColumnEvent(
          item: event.item,
          parentId: event.parentId,
          parentContainerId: event.parentContainerId!,
          columnId: event.columnId!,
          columnIndex: event.columnIndex,
        ),
      );
    } else {
      add(AddSimpleFormBuilderItemEvent(item: event.item, parentId: event.parentId));
    }
  }

  FutureOr<void> _onAddSimpleFormBuilderItemEvent(AddSimpleFormBuilderItemEvent event, Emitter<FormBuilderState> emit) {
    debugPrint('AddSimpleFormBuilderItemEvent: controlType: ${event.item.controlType}, parentId: ${event.parentId}');

    FormBuilderItem item = event.item.copyWithBaseFields(id: Uuid().v4());
    item = _addMetaDataToItem(item);

    List<FormBuilderItem> items = List<FormBuilderItem>.from(state.items);

    items = _insertItemIntoList(items: items, parentId: event.parentId, newItem: item);

    emit(FormBuilderState(items: items));
  }

  FutureOr<void> _onAddSimpleFormBuilderItemIntoColumnEvent(
    AddSimpleFormBuilderItemIntoColumnEvent event,
    Emitter<FormBuilderState> emit,
  ) {
    debugPrint(
      'AddSimpleFormBuilderItemIntoColumnEvent: controlType: ${event.item.controlType}, parentId: ${event.parentId}, parentContainerId: ${event.parentContainerId}, columnId: ${event.columnId}',
    );

    FormBuilderItem item = event.item.copyWithBaseFields(
      id: Uuid().v4(),
      parentContainerId: event.parentContainerId,
      columnId: event.columnId,
      columnIndex: event.columnIndex,
    );

    item = _addMetaDataToItem(item);

    List<FormBuilderItem> items = List<FormBuilderItem>.from(state.items);

    items = _addItemToColumn(
      items: items,
      columnContainerId: event.parentContainerId,
      columnId: event.columnId,
      newItemToAdd: item,
      parentId: event.parentId,
    );

    emit(FormBuilderState(items: items));
  }

  FutureOr<void> _onAddFormBuilderLayoutColumnItemEvent(
    AddFormBuilderLayoutColumnItemEvent event,
    Emitter<FormBuilderState> emit,
  ) {
    debugPrint(
      'AddFormBuilderLayoutItemEvent: controlType: ${event.item.controlType}, parentId: ${event.parentId}, parentContainerId: ${event.parentContainerId}, columnId: ${event.columnId}',
    );

    final FormBuilderItem item = event.item.copyWith(
      id: Uuid().v4(),
      properties: FormBuilderItemPropertiesColumns(columns: {'column1': [], 'column2': []}),
    );

    if (event.parentId == null || event.parentId!.isEmpty) {
      final updatedItems = List<FormBuilderItem>.from(state.items)..insert(0, item);

      emit(FormBuilderState(items: updatedItems));
      return null;
    }

    final items = List<FormBuilderItem>.from(state.items);

    final parentIndex = _findParentIndex(items, event.parentId!);

    if (parentIndex == -1) {
      items.add(item);
    } else {
      items.insert(parentIndex + 1, item);
    }

    emit(FormBuilderState(items: items));
  }

  FutureOr<void> _onRemoveFormBuilderItemEvent(RemoveFormBuilderItemEvent event, Emitter<FormBuilderState> emit) {
    if (_checkIfParametersForColumnIsValid(event.parentContainerId, event.columnId)) {
      final items = List<FormBuilderItem>.from(state.items);

      final parentContainerIndex = _findParentIndex(items, event.parentContainerId!);
      if (parentContainerIndex != -1) {
        final parentContainerItem = items[parentContainerIndex];
        final columnItems = List<FormBuilderItem>.from(
          (parentContainerItem.properties as FormBuilderItemPropertiesColumns).columns[event.columnId!] ?? const [],
        );

        columnItems.removeWhere((item) => item.id == event.itemId);

        final updatedParentContainerItem = parentContainerItem.copyWith(
          properties: FormBuilderItemPropertiesColumns(
            columns: {
              ...((parentContainerItem.properties as FormBuilderItemPropertiesColumns).columns),
              event.columnId!: columnItems,
            },
          ),
        );
        items[parentContainerIndex] = updatedParentContainerItem;

        emit(state.copyWith(items: items, showDataZones: false));
      }
    } else {
      final updatedItems = List<FormBuilderItem>.from(state.items)..removeWhere((item) => item.id == event.itemId);

      emit(state.copyWith(items: updatedItems, showDataZones: false));
    }
  }

  FutureOr<void> _onShowFormBuilderDataZonesEvent(ShowFormBuilderDataZonesEvent event, Emitter<FormBuilderState> emit) {
    emit(state.copyWith(showDataZones: true));
  }

  FutureOr<void> _onHideFormBuilderDataZonesEvent(HideFormBuilderDataZonesEvent event, Emitter<FormBuilderState> emit) {
    emit(state.copyWith(showDataZones: false));
  }

  FutureOr<void> _onReorderFormBuilderItemEvent(ReorderFormBuilderItemEvent event, Emitter<FormBuilderState> emit) {
    final items = List<FormBuilderItem>.from(state.items);

    if (_checkIfParametersForColumnIsValid(event.item.parentContainerId, event.item.columnId)) {
      final parentContainerIndex = _findParentIndex(items, event.item.parentContainerId!);
      if (parentContainerIndex != -1) {
        final parentContainerItem = items[parentContainerIndex];
        final columnItems = List<FormBuilderItem>.from(
          (parentContainerItem.properties as FormBuilderItemPropertiesColumns).columns[event.item.columnId!] ?? const [],
        );

        final itemToMove = columnItems.removeAt(event.oldIndex);
        columnItems.insert(event.newIndex, itemToMove);

        final updatedParentContainerItem = parentContainerItem.copyWith(
          properties: FormBuilderItemPropertiesColumns(
            columns: {
              ...((parentContainerItem.properties as FormBuilderItemPropertiesColumns).columns),
              event.item.columnId!: columnItems,
            },
          ),
        );
        items[parentContainerIndex] = updatedParentContainerItem;

        emit(state.copyWith(items: items));
      }
    } else {
      final itemToMove = items.removeAt(event.oldIndex);
      items.insert(event.newIndex, itemToMove);

      emit(state.copyWith(items: items));
    }
  }

  FutureOr<void> _onFetchFormApiModelEvent(FetchFormApiModelEvent event, Emitter<FormBuilderState> emit) {
    final result = ConverterToFormBuilderItems.convert(formApiExample.fields);

    emit(FormBuilderState(items: result.toList()));
  }

  FormBuilderItem _addMetaDataToItem(FormBuilderItem item) {
    return switch (item.controlType) {
      ControlTypesEnum.textField => item.copyWith(
        properties: FormBuilderItemPropertiesTextField(label: item.previewLabelForItem),
      ),
      ControlTypesEnum.numberField => item.copyWith(
        properties: FormBuilderItemPropertiesNumberField(label: item.previewLabelForItem),
      ),
      ControlTypesEnum.checkbox => item.copyWith(
        properties: FormBuilderItemPropertiesCheckboxField(label: item.previewLabelForItem),
      ),
      ControlTypesEnum.heading => item.copyWith(properties: FormBuilderItemPropertiesHeader(heading: item.previewLabelForItem)),
      _ => throw UnsupportedError('_addMetaDataToItem: Unsupported form control type: ${item.controlType}'),
    };
  }

  FutureOr<void> _onUpdateFormItemValuesEvent(UpdateFormItemValuesEvent event, Emitter<FormBuilderState> emit) {
    final items = List<FormBuilderItem>.from(state.items);
    final updatedItems = _updateItemInTree(items: items, updatedItem: event.item);
    emit(state.copyWith(items: updatedItems));
  }

  List<FormBuilderItem> _updateItemInTree({required List<FormBuilderItem> items, required FormBuilderItem updatedItem}) {
    return items.map((item) {
      if (item.id == updatedItem.id) {
        return updatedItem;
      }

      if (item.controlType != ControlTypesEnum.columns || item.properties is! FormBuilderItemPropertiesColumns) {
        return item;
      }

      final columns = (item.properties as FormBuilderItemPropertiesColumns).columns;
      final updatedColumns = <String, List<FormBuilderItem>>{};

      for (final entry in columns.entries) {
        updatedColumns[entry.key] = _updateItemInTree(items: entry.value, updatedItem: updatedItem);
      }

      return item.copyWith(properties: FormBuilderItemPropertiesColumns(columns: updatedColumns));
    }).toList();
  }

  List<FormBuilderItem> _addItemToColumn({
    required List<FormBuilderItem> items,
    required String columnContainerId,
    required String columnId,
    required FormBuilderItem newItemToAdd,
    required String? parentId,
  }) {
    // Make a copy of the items list to avoid modifying the original list
    final localItems = List<FormBuilderItem>.from(items);

    // Find index of the Column container in the root items list
    final columnItemIndex = _findParentIndex(items, columnContainerId);

    if (columnItemIndex == -1) {
      return items;
    }

    // Get the Column item
    final parentContainerItem = items[columnItemIndex];
    // Get the list of items in the specified column
    List<FormBuilderItem> columnItems = List<FormBuilderItem>.from(
      (parentContainerItem.properties as FormBuilderItemPropertiesColumns).columns[columnId] ?? const [],
    );
    columnItems = _insertItemIntoList(items: columnItems, parentId: parentId ?? '', newItem: newItemToAdd);

    // columnItems.add(newItemToAdd);

    // Create a new instance of the parent container item with the updated column items
    // columnId is the key of the column in the columns map, and columnItems is the updated list of items for that column
    final updatedParentContainerItem = parentContainerItem.copyWith(
      properties: FormBuilderItemPropertiesColumns(
        columns: {...((parentContainerItem.properties as FormBuilderItemPropertiesColumns).columns), columnId: columnItems},
      ),
    );
    localItems[columnItemIndex] = updatedParentContainerItem;

    return localItems;
  }

  int _findParentIndex(List<FormBuilderItem> items, String parentId) {
    for (var i = 0; i < items.length; i++) {
      if (items[i].id == parentId) {
        return i;
      }
    }
    return -1;
  }

  List<FormBuilderItem> _insertItemIntoList({
    required List<FormBuilderItem> items,
    required String? parentId,
    required FormBuilderItem newItem,
  }) {
    // If parentId is null or empty, insert the new item at the beginning of the list
    if (parentId == null || parentId.isEmpty) {
      items.insert(0, newItem);
      return items;
    }

    final parentIndex = _findParentIndex(items, parentId);
    if (parentIndex != -1) {
      items.insert(parentIndex + 1, newItem);
    } else {
      items.add(newItem);
    }

    return items;
  }

  bool _checkIfParametersForColumnIsValid(String? parentContainerId, String? columnId) {
    return parentContainerId != null && parentContainerId.isNotEmpty && columnId != null && columnId.isNotEmpty;
  }

  @override
  Future<void> close() {
    _formRenderBuilderRepositoryStream.cancel();
    return super.close();
  }
}
