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
    on<AddSimpleFormBuilderItemEvent>(_onAddSimpleFormBuilderItemEvent);
    on<AddSimpleFormBuilderItemIntoColumnEvent>(_onAddSimpleFormBuilderItemIntoColumnEvent);
    on<AddFormBuilderLayoutColumnItemEvent>(_onAddFormBuilderLayoutColumnItemEvent);
    on<RemoveFormBuilderItemEvent>(_onRemoveFormBuilderItemEvent);
    on<ShowFormBuilderDataZonesEvent>(_onShowFormBuilderDataZonesEvent);
    on<HideFormBuilderDataZonesEvent>(_onHideFormBuilderDataZonesEvent);
    on<ReorderFormBuilderItemEvent>(_onReorderFormBuilderItemEvent);

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
        _addSimpleFormBuilderItem<FormBuilderInputItem>(event, item);
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
        _addSimpleFormBuilderItem<FormBuilderHeadingItem>(event, item);
        break;
    }
  }

  void _addSimpleFormBuilderItem<T>(AddFormBuilderItemEvent event, T item) {
    if (_checkIfParametersForColumnIsValud(event.parentContainerId, event.columnId)) {
      add(
        AddSimpleFormBuilderItemIntoColumnEvent<T>(
          item: item,
          parentId: event.parentId,
          parentContainerId: event.parentContainerId!,
          columnId: event.columnId!,
          columnIndex: event.columnIndex,
        ),
      );
    } else {
      add(AddSimpleFormBuilderItemEvent<T>(item: item, parentId: event.parentId));
    }
  }

  FutureOr<void> _onAddSimpleFormBuilderItemEvent(AddSimpleFormBuilderItemEvent event, Emitter<FormBuilderState> emit) {
    debugPrint('AddSimpleFormBuilderItemEvent: controlType: ${event.item.controlType}, parentId: ${event.parentId}');

    final FormBuilderItem item = event.item.copyWithBaseFields(id: Uuid().v4());

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

    final FormBuilderItem item = event.item.copyWithBaseFields(
      id: Uuid().v4(),
      parentContainerId: event.parentContainerId,
      columnId: event.columnId,
      columnIndex: event.columnIndex,
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
      'AddFormBuilderLayoutItemEvent: controlType: ${event.item.controlType}, parentId: ${event.parentId}, parentContainerId: ${event.parentContainerId}, columnId: ${event.columnId}',
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

  FutureOr<void> _onShowFormBuilderDataZonesEvent(ShowFormBuilderDataZonesEvent event, Emitter<FormBuilderState> emit) {
    emit(state.copyWith(showDataZones: true));
  }

  FutureOr<void> _onHideFormBuilderDataZonesEvent(HideFormBuilderDataZonesEvent event, Emitter<FormBuilderState> emit) {
    emit(state.copyWith(showDataZones: false));
  }

  FutureOr<void> _onReorderFormBuilderItemEvent(ReorderFormBuilderItemEvent event, Emitter<FormBuilderState> emit) {
    final items = List<FormBuilderItem>.from(state.items);

    if (_checkIfParametersForColumnIsValud(event.item.parentContainerId, event.item.columnId)) {
      final parentContainerIndex = _findParentIndex(items, event.item.parentContainerId!);
      if (parentContainerIndex != -1) {
        final parentContainerItem = items[parentContainerIndex] as FormBuilderColumnsItem;
        final columnItems = parentContainerItem.columns[event.item.columnId!] ?? [];

        final itemToMove = columnItems.removeAt(event.oldIndex);
        columnItems.insert(event.newIndex, itemToMove);

        final updatedParentContainerItem = parentContainerItem.copyWith(
          columns: {...parentContainerItem.columns, event.item.columnId!: columnItems},
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

  bool _checkIfParametersForColumnIsValud(String? parentContainerId, String? columnId) {
    return parentContainerId != null && parentContainerId.isNotEmpty && columnId != null && columnId.isNotEmpty;
  }

  @override
  Future<void> close() {
    _formRenderBuilderRepositoryStream.cancel();
    return super.close();
  }
}
