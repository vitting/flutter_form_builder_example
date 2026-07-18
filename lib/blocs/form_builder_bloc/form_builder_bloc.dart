import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_state.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';
import 'package:flutter_form_builder_example/repositories/form_render_builder_repository.dart';
import 'package:uuid/uuid.dart';

part 'form_builder_event.dart';

class FormBuilderBloc extends Bloc<FormBuilderEvent, FormBuilderState> {
  final FormRenderBuilderRepository _formRenderBuilderRepository;
  late final StreamSubscription<bool> _formRenderBuilderRepositoryStream;
  FormBuilderBloc(this._formRenderBuilderRepository) : super(FormBuilderState(items: [])) {
    on<AddFormBuilderItemEvent>(_onAddFormBuilderItemEventEvent);
    on<AddFormBuilderInputItemEvent>(_onAddFormBuilderInputItemEvent);
    on<AddFormBuilderInputItemIntoColumnEvent>(_onAddFormBuilderInputItemIntoColumnEvent);
    on<AddFormBuilderLayoutHeadingItemEvent>(_onAddFormBuilderLayoutHeadingItemEvent);
    on<AddFormBuilderLayoutColumnItemEvent>(_onAddFormBuilderLayoutColumnItemEvent);
    on<RemoveFormBuilderItemEvent>(_onRemoveFormBuilderItemEvent);
    on<ShowFormBuilderDataZonesEvent>(_showFormBuilderDataZonesEvent);
    on<HideFormBuilderDataZonesEvent>(_hideFormBuilderDataZonesEvent);

    _formRenderBuilderRepositoryStream = _formRenderBuilderRepository.dataStream.listen((showDataZones) {
      if (showDataZones) {
        add(ShowFormBuilderDataZonesEvent());
      } else {
        add(HideFormBuilderDataZonesEvent());
      }
    });
  }

  FutureOr<void> _onAddFormBuilderItemEventEvent(AddFormBuilderItemEvent event, Emitter<FormBuilderState> emit) {
    switch (event.item) {
      case final FormBuilderInputItem item:
        if (event.parentContainerId != null &&
            event.parentContainerId!.isNotEmpty &&
            event.columnId != null &&
            event.columnId!.isNotEmpty) {
          add(
            AddFormBuilderInputItemIntoColumnEvent(
              item: item,
              parentId: event.parentId,
              parentContainerId: event.parentContainerId!,
              columnId: event.columnId!,
              columnIndex: event.columnIndex,
            ),
          );
        } else {
          add(AddFormBuilderInputItemEvent(item: item, parentId: event.parentId));
        }

        break;
      case final FormBuilderColumnsItem item:
        add(
          AddFormBuilderLayoutColumnItemEvent(
            item: item,
            parentId: event.parentId,
            parentContainerId: event.parentContainerId,
            columnId: event.columnId,
            columnIndex: event.columnIndex,
          ),
        );
        break;
      case final FormBuilderHeadingItem item:
        add(AddFormBuilderLayoutHeadingItemEvent(item: item));
        break;
    }
  }

  // TODO: ER I GANG MED AT IMPLEMENTERE HEADING
  FutureOr<void> _onAddFormBuilderLayoutHeadingItemEvent(
    AddFormBuilderLayoutHeadingItemEvent event,
    Emitter<FormBuilderState> emit,
  ) {
    debugPrint('AddFormBuilderLayoutHeadingItem: controlType: ${event.item.controlType.name}, parentId: ${event.parentId}');

    final FormBuilderHeadingItem item = event.item.copyWith(id: Uuid().v4());

    List<FormBuilderItem> items = List<FormBuilderItem>.from(state.items);

    items = _insertItemIntoList(items: items, parentId: event.parentId, newItem: item);

    emit(FormBuilderState(items: items));
  }

  FutureOr<void> _onAddFormBuilderInputItemEvent(AddFormBuilderInputItemEvent event, Emitter<FormBuilderState> emit) {
    debugPrint('AddFormBuilderInputItemEvent: controlType: ${event.item.controlType.name}, parentId: ${event.parentId}');

    final FormBuilderInputItem item = event.item.copyWith(id: Uuid().v4());

    List<FormBuilderItem> items = List<FormBuilderItem>.from(state.items);

    items = _insertItemIntoList(items: items, parentId: event.parentId, newItem: item);

    emit(FormBuilderState(items: items));
  }

  FutureOr<void> _onAddFormBuilderInputItemIntoColumnEvent(
    AddFormBuilderInputItemIntoColumnEvent event,
    Emitter<FormBuilderState> emit,
  ) {
    debugPrint(
      'AddFormBuilderInputItemIntoColumnEvent: controlType: ${event.item.controlType.name}, parentId: ${event.parentId}, parentContainerId: ${event.parentContainerId}, columnId: ${event.columnId}',
    );

    final FormBuilderInputItem item = event.item.copyWith(
      id: Uuid().v4(),
      columnId: event.columnId,
      columnIndex: event.columnIndex,
      parentContainerId: event.parentContainerId,
    );

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
      'AddFormBuilderLayoutItemEvent: controlType: ${event.item.controlType.name}, parentId: ${event.parentId}, parentContainerId: ${event.parentContainerId}, columnId: ${event.columnId}',
    );
    final FormBuilderColumnsItem itemAsColumn = event.item;
    final FormBuilderColumnsItem item = itemAsColumn.copyWith(id: Uuid().v4(), columns: {'column1': [], 'column2': []});

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
    final updatedItems = List<FormBuilderItem>.from(state.items)..removeWhere((item) => item.id == event.itemId);
    emit(state.copyWith(items: updatedItems, showDataZones: false));
  }

  FutureOr<void> _showFormBuilderDataZonesEvent(ShowFormBuilderDataZonesEvent event, Emitter<FormBuilderState> emit) {
    emit(state.copyWith(showDataZones: true));
  }

  FutureOr<void> _hideFormBuilderDataZonesEvent(HideFormBuilderDataZonesEvent event, Emitter<FormBuilderState> emit) {
    emit(state.copyWith(showDataZones: false));
  }

  List<FormBuilderItem> _addItemToColumn({
    required List<FormBuilderItem> items,
    required String columnContainerId,
    required String columnId,
    required FormBuilderInputItem newItemToAdd,
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
    final parentContainerItem = items[columnItemIndex] as FormBuilderColumnsItem;
    // Get the list of items in the specified column
    List<FormBuilderItem> columnItems = parentContainerItem.columns[columnId] ?? [];
    columnItems = _insertItemIntoList(items: columnItems, parentId: parentId ?? '', newItem: newItemToAdd);

    // columnItems.add(newItemToAdd);

    // Create a new instance of the parent container item with the updated column items
    // columnId is the key of the column in the columns map, and columnItems is the updated list of items for that column
    final updatedParentContainerItem = parentContainerItem.copyWith(
      columns: {...parentContainerItem.columns, columnId: columnItems},
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

  @override
  Future<void> close() {
    _formRenderBuilderRepositoryStream.cancel();
    return super.close();
  }
}
