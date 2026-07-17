import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/drop_zone/drop_zone.dart';
import 'package:flutter_form_builder_example/form_builder_render/form_control_manage_container.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

class FormRenderBuilderColumns extends StatelessWidget {
  final FormBuilderColumnsItem parentContainerItem;
  final List<Widget> Function(String columnId) buildFormControls;
  final void Function(String itemIdToDelete) onDelete;
  final void Function(int columnIndex, String columnId)? onColumnGeneration;

  const FormRenderBuilderColumns({
    super.key,
    required this.buildFormControls,
    required this.parentContainerItem,
    required this.onDelete,
    this.onColumnGeneration,
  });

  List<Widget> _generateColumns(FormBuilderColumnsItem item) {
    final List<Widget> columns = [];
    int index = 0;

    for (final column in item.columns.entries) {
      final formControls = buildFormControls(column.key);
      index++;
      onColumnGeneration?.call(index, column.key);
      columns.add(
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey[200],
            ),
            child: Column(
              children: [
                DropZone(
                  columnIndex: index,
                  parentContainerItem: parentContainerItem,
                  parentId: parentContainerItem.id,
                  parentContainerId: parentContainerItem.id,
                  columnId: column.key,
                  showExpaned: column.value.isEmpty,
                  isVisible: column.value.isEmpty,
                ),
                ...formControls,
              ],
            ),
          ),
        ),
      );
    }

    return columns;
  }

  @override
  Widget build(BuildContext context) {
    return FormControlManageContainer(
      onDelete: () {
        onDelete(parentContainerItem.id);
      },
      child: Row(children: [..._generateColumns(parentContainerItem)]),
    );
  }
}
