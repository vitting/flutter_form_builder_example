import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/enums/form_element_type_enum.dart';
import 'package:flutter_form_builder_example/form_controls/menu_control/drag_container.dart';
import 'package:flutter_form_builder_example/get_it/injection.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';
import 'package:flutter_form_builder_example/repositories/form_render_builder_repository.dart';

class DragControl extends StatelessWidget {
  final Widget child;
  final ControlTypesEnum controlType;
  final FormElementTypeEnum formElementType;
  const DragControl({super.key, required this.child, required this.controlType, required this.formElementType});

  @override
  Widget build(BuildContext context) {
    final formRenderBuilderRepository = getIt<FormRenderBuilderRepository>();
    return Draggable<FormBuilderItem>(
      data: FormBuilderItem(id: '', controlType: controlType, formElementType: formElementType),
      feedback: DragContainer(isDragging: true, child: child),
      childWhenDragging: DragContainer(isDragging: true, child: child),
      onDragStarted: () {
        formRenderBuilderRepository.updateData(true);
      },
      onDragEnd: (_) {
        formRenderBuilderRepository.updateData(false);
      },
      child: child,
    );
  }
}
