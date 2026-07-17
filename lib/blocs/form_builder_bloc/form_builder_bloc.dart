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
  FormBuilderBloc(this._formRenderBuilderRepository) : super(FormBuilderState(items: [])) {
    on<AddFormBuilderItemEvent>((event, emit) {
      switch (event.item) {
        case final FormBuilderInputItem item:
          add(
            AddFormBuilderInputItemEvent(
              item: item,
              parentId: event.parentId,
              parentContainerId: event.parentContainerId,
              columnId: event.columnId,
              columnIndex: event.columnIndex,
            ),
          );
          break;
        case final FormBuilderColumnsItem item:
          add(
            AddFormBuilderLayoutItemEvent(
              item: item,
              parentId: event.parentId,
              parentContainerId: event.parentContainerId,
              columnId: event.columnId,
              columnIndex: event.columnIndex,
            ),
          );
          break;
      }
    });

    on<AddFormBuilderInputItemEvent>((event, emit) {
      debugPrint(
        'AddFormBuilderInputItemEvent: controlType: ${event.item.controlType.name}, parentId: ${event.parentId}, parentContainerId: ${event.parentContainerId}, columnId: ${event.columnId}',
      );

      final FormBuilderInputItem item = event.item.copyWith(
        id: Uuid().v4(),
        columnId: event.columnId,
        columnIndex: event.columnIndex,
        parentContainerId: event.parentContainerId,
      );

      if (event.parentId == null || event.parentId!.isEmpty) {
        final updatedItems = List<FormBuilderItem>.from(state.items)..insert(0, item);

        emit(FormBuilderState(items: updatedItems));
        return;
      }

      List<FormBuilderItem> items = List<FormBuilderItem>.from(state.items);

      if (event.parentContainerId != null &&
          event.parentContainerId!.isNotEmpty &&
          event.columnId != null &&
          event.columnId!.isNotEmpty) {
        items = _addItemToColumn(items, event.parentContainerId!, event.columnId!, item);
      } else {
        // If no parentContainerId and columnId are provided, insert the item after the parentId
        items = _insertItemAfterParent(items, event.parentId!, item);
      }

      emit(FormBuilderState(items: items));
    });

    on<AddFormBuilderLayoutItemEvent>((event, emit) {
      debugPrint(
        'AddFormBuilderLayoutItemEvent: controlType: ${event.item.controlType.name}, parentId: ${event.parentId}, parentContainerId: ${event.parentContainerId}, columnId: ${event.columnId}',
      );
      final FormBuilderColumnsItem itemAsColumn = event.item as FormBuilderColumnsItem;
      final FormBuilderColumnsItem item = itemAsColumn.copyWith(id: Uuid().v4(), columns: {'column1': [], 'column2': []});

      if (event.parentId == null || event.parentId!.isEmpty) {
        final updatedItems = List<FormBuilderItem>.from(state.items)..insert(0, item);

        emit(FormBuilderState(items: updatedItems));
        return;
      }

      final items = List<FormBuilderItem>.from(state.items);

      final parentIndex = _findParentIndex(items, event.parentId!);

      if (parentIndex == -1) {
        items.add(item);
      } else {
        items.insert(parentIndex + 1, item);
      }

      emit(FormBuilderState(items: items));
    });

    on<RemoveFormBuilderItemEvent>((event, emit) {
      final updatedItems = List<FormBuilderItem>.from(state.items)..removeWhere((item) => item.id == event.itemId);
      emit(state.copyWith(items: updatedItems, showDataZones: false));
    });

    on<ShowFormBuilderDataZonesEvent>((event, emit) {
      emit(state.copyWith(showDataZones: true));
    });

    on<HideFormBuilderDataZonesEvent>((event, emit) {
      emit(state.copyWith(showDataZones: false));
    });

    _formRenderBuilderRepository.dataStream.listen((showDataZones) {
      if (showDataZones) {
        add(ShowFormBuilderDataZonesEvent());
      } else {
        add(HideFormBuilderDataZonesEvent());
      }
    });
  }

  List<FormBuilderItem> _addItemToColumn(
    List<FormBuilderItem> items,
    String parentContainerId,
    String columnId,
    FormBuilderInputItem newItemToAdd,
  ) {
    final localItems = List<FormBuilderItem>.from(items);
    // Find index of the Column container
    final columnItemIndex = _findParentIndex(items, parentContainerId);

    if (columnItemIndex == -1) {
      return items;
    }

    // Get the Column item
    final parentContainerItem = items[columnItemIndex] as FormBuilderColumnsItem;
    // Get the list of items in the specified column
    final columnItems = parentContainerItem.columns[columnId] ?? [];

    columnItems.add(newItemToAdd);

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

  List<FormBuilderItem> _insertItemAfterParent(List<FormBuilderItem> items, String parentId, FormBuilderItem newItem) {
    final parentIndex = _findParentIndex(items, parentId);
    if (parentIndex != -1) {
      items.insert(parentIndex + 1, newItem);
    } else {
      items.add(newItem);
    }

    return items;
  }
}
