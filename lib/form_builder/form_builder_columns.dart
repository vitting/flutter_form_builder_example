import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/drop_zone/drop_zone.dart';
import 'package:flutter_form_builder_example/form_builder/form_control_manage_container.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

class FormBuilderColumns extends StatelessWidget {
  final FormBuilderColumnsItem parentContainerItem;
  final Widget Function(String columnId) buildFormControls;
  final void Function(String itemIdToDelete) onDelete;
  final bool showDataZones;
  final int index;

  const FormBuilderColumns({
    super.key,
    required this.buildFormControls,
    required this.parentContainerItem,
    required this.onDelete,
    this.showDataZones = false,
    required this.index,
  });

  List<Widget> _generateColumns(FormBuilderColumnsItem item) {
    final List<Widget> columns = [];
    int index = 0;

    for (final column in item.columns.entries) {
      final formControls = buildFormControls(column.key);
      index++;
      bool isColumnLast = index == item.columns.length;

      columns.add(
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),

              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
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
                formControls,
              ],
            ),
          ),
        ),
      );

      if (isColumnLast == false) {
        columns.add(SizedBox(width: 4.0)); // Add spacing between columns
      }
    }

    return columns;
  }

  @override
  Widget build(BuildContext context) {
    return FormControlManageContainer(
      item: parentContainerItem,
      dragHandlerReOrderListIndex: index,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Columns', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8.0),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [..._generateColumns(parentContainerItem)]),
        ],
      ),
    );
  }
}
