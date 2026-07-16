import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_state.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';
import 'package:uuid/uuid.dart';

part 'form_builder_event.dart';

class FormBuilderBloc extends Bloc<FormBuilderEvent, FormBuilderState> {
  FormBuilderBloc() : super(FormBuilderState(items: [])) {
    on<AddFormBuilderItemEvent>((event, emit) {
      final item = event.item.copyWith(id: Uuid().v4());

      if (event.parentId == null || event.parentId!.isEmpty) {
        final updatedItems = List<FormBuilderItem>.from(state.items)..insert(0, item);

        emit(FormBuilderState(items: updatedItems));
        return;
      }

      final updatedItems = List<FormBuilderItem>.from(state.items);
      final parentIndex = updatedItems.indexWhere((item) => item.id == event.parentId);
      if (parentIndex == -1) {
        updatedItems.add(item);
      } else {
        updatedItems.insert(parentIndex + 1, item);
      }

      emit(FormBuilderState(items: updatedItems));
    });

    on<RemoveFormBuilderItemEvent>((event, emit) {
      final updatedItems = List<FormBuilderItem>.from(state.items)..removeWhere((item) => item.id == event.itemId);
      emit(FormBuilderState(items: updatedItems));
    });
  }
}
