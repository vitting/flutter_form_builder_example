import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_state.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';
import 'package:flutter_form_builder_example/repositories/form_render_builder_repository.dart';
import 'package:uuid/uuid.dart';

part 'form_builder_event.dart';

class FormBuilderBloc extends Bloc<FormBuilderEvent, FormBuilderState> {
  final FormRenderBuilderRepository _formRenderBuilderRepository;
  FormBuilderBloc(this._formRenderBuilderRepository) : super(FormBuilderState(items: [])) {
    on<AddFormBuilderItemEvent>((event, emit) {
      final FormBuilderInputItem itemAsInput = event.item as FormBuilderInputItem;
      final FormBuilderInputItem item = itemAsInput.copyWith(id: Uuid().v4());

      if (event.parentId == null || event.parentId!.isEmpty) {
        final updatedItems = List<FormBuilderItem>.from(state.items)..insert(0, item);

        emit(FormBuilderState(items: updatedItems));
        return;
      }

      final items = List<FormBuilderInputItem>.from(state.items);
      final parentItem = _findParentItem(items, event.parentId!);

      // if (parentItem != null && parentItem.formElementType == FormElementTypeEnum.columns) {
      //   throw Exception('Parent item not found');
      // }

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

  FormBuilderInputItem? _findParentItem(List<FormBuilderInputItem> items, String parentId) {
    for (var item in items) {
      if (item.id == parentId) {
        return item;
        //   } else if (item.children.isNotEmpty) {
        //     final foundItem = _findParentItem(item.children, parentId);
        //     if (foundItem != null) {
        //       return foundItem;
        //     }
        //   }
        // }
        // throw Exception('Parent item not found');
      }
    }
  }

  int _findParentIndex(List<FormBuilderInputItem> items, String parentId) {
    for (var i = 0; i < items.length; i++) {
      if (items[i].id == parentId) {
        return i;
        // } else if (items[i].children.isNotEmpty) {
        //   final foundIndex = _findParentIndex(items[i].children, parentId);
        //   if (foundIndex != -1) {
        //     return foundIndex;
        //   }
      }
    }
    return -1;
  }
}
