import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/drop_zone/drop_zone.dart';
import 'package:flutter_form_builder_example/form_builder/form_control_manage_container.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

class FormBuilderColumns extends StatelessWidget {
  final FormBuilderColumnsItem parentContainerItem;
  final List<Widget> Function(String columnId) buildFormControls;
  final void Function(String itemIdToDelete) onDelete;
  final bool showDataZones;

  const FormBuilderColumns({
    super.key,
    required this.buildFormControls,
    required this.parentContainerItem,
    required this.onDelete,
    this.showDataZones = false,
  });

  List<Widget> _generateColumns(FormBuilderColumnsItem item) {
    final List<Widget> columns = [];
    int index = 0;

    for (final column in item.columns.entries) {
      final formControls = buildFormControls(column.key);
      index++;
      columns.add(
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.grey[200],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropZone(
                  columnIndex: index,
                  parentContainerItem: parentContainerItem,
                  parentContainerId: parentContainerItem.id,
                  columnId: column.key,
                  showExpaned: column.value.isEmpty,
                  isVisible: column.value.isEmpty || showDataZones,
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
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [..._generateColumns(parentContainerItem)]),
    );
  }
}
