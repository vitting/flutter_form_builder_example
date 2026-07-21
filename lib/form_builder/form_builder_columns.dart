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

  BorderRadiusGeometry? _getBorderRadius(bool isFirst, bool isLast) {
    // if (isFirst) {
    //   return BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8));
    // } else if (isLast) {
    //   return BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8));
    // }
    return BorderRadius.circular(8);
  }

  List<Widget> _generateColumns(FormBuilderColumnsItem item) {
    final List<Widget> columns = [];
    int index = 0;

    for (final column in item.columns.entries) {
      final formControls = buildFormControls(column.key);
      index++;
      bool isColumnFirst = index == 1;
      bool isColumnLast = index == item.columns.length;

      columns.add(
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),

              borderRadius: _getBorderRadius(isColumnFirst, isColumnLast),
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
      dragHandlerReOrderListIndex: index,
      onDelete: () {
        onDelete(parentContainerItem.id);
      },
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [..._generateColumns(parentContainerItem)]),
    );
  }
}
