import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_state.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_reorder_cubit/form_builder_reorder_cubit.dart';
import 'package:flutter_form_builder_example/converter/converter_from_form_builder_items.dart';
import 'package:flutter_form_builder_example/converter/form_api_example.dart';
import 'package:flutter_form_builder_example/drop_zone/drop_zone.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/form_builder/form_control_manage_container.dart';
import 'package:flutter_form_builder_example/form_builder/form_builder_columns.dart';
import 'package:flutter_form_builder_example/form_builder/reorder_button.dart';
import 'package:flutter_form_builder_example/form_controls/form_checkbox.dart';
import 'package:flutter_form_builder_example/form_controls/form_heading.dart';
import 'package:flutter_form_builder_example/form_controls/form_text_field.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';
import 'package:flutter_json/flutter_json.dart';

class FormBuilder extends StatefulWidget {
  const FormBuilder({super.key});

  @override
  State<FormBuilder> createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  Map<String, dynamic>? json;
  bool showJson = false;

  Widget _generateInput(FormBuilderItem item, int index) {
    return switch (item.controlType) {
      ControlTypesEnum.textField => FormControlManageContainer(
        item: item,
        dragHandlerReOrderListIndex: index,
        child: FormTextField(label: ControlTypesEnum.textField.name, isFormRenderControl: true, isEnabled: false),
      ),

      ControlTypesEnum.numberField => FormControlManageContainer(
        item: item,
        dragHandlerReOrderListIndex: index,
        child: FormTextField(label: ControlTypesEnum.numberField.name, isFormRenderControl: true, isEnabled: false),
      ),
      ControlTypesEnum.checkbox => FormControlManageContainer(
        item: item,
        dragHandlerReOrderListIndex: index,
        child: FormCheckbox(label: ControlTypesEnum.checkbox.name, isFormRenderControl: true, isEnabled: false),
      ),
      ControlTypesEnum.heading => FormControlManageContainer(
        item: item,
        dragHandlerReOrderListIndex: index,
        child: FormHeading(text: 'Hello'),
      ),
      _ => SizedBox.shrink(),
    };
  }

  void _onDeleteItem(BuildContext context, String itemId) {
    BlocProvider.of<FormBuilderBloc>(context).add(RemoveFormBuilderItemEvent(itemId: itemId));
  }

  Widget _getControl(FormBuilderItem item, int index, {bool showDataZones = false}) {
    return switch (item) {
      FormBuilderInputItem() => _generateInput(item, index),
      FormBuilderHeadingItem() => _generateInput(item, index),
      FormBuilderColumnsItem() => FormBuilderColumns(
        index: index,
        showDataZones: showDataZones,
        parentContainerItem: item,
        buildFormControls: (columnId) {
          final columnItems = item.columns[columnId] ?? [];
          return _buildFormControls(context, items: columnItems, showDataZones: showDataZones);
        },
        onDelete: (itemIdToDelete) {
          _onDeleteItem(context, itemIdToDelete);
        },
      ),
      FormBuilderItem() => throw UnimplementedError(),
    };
  }

  Widget _buildFormControls(BuildContext context, {required List<FormBuilderItem> items, bool showDataZones = false}) {
    return ReorderableListView.builder(
      shrinkWrap: true,
      proxyDecorator: (child, index, animation) {
        return Material(elevation: 1.0, color: Colors.transparent, shadowColor: Colors.black.withAlpha(100), child: child);
      },
      buildDefaultDragHandles: false,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          key: ValueKey(item.id),
          child: Column(
            children: [
              _getControl(item, index, showDataZones: showDataZones),
              DropZone(
                parentId: item.id,
                isVisible: showDataZones,
                parentContainerId: item.parentContainerId,
                columnId: item.columnId,
                columnIndex: item.columnIndex,
              ),
            ],
          ),
        );
      },
      itemCount: items.length,

      onReorderItem: (oldIndex, newIndex) {
        final item = items.elementAt(oldIndex);
        BlocProvider.of<FormBuilderBloc>(
          context,
        ).add(ReorderFormBuilderItemEvent(item: item, oldIndex: oldIndex, newIndex: newIndex));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBuilderBloc, FormBuilderState>(
      builder: (context, state) {
        final items = state.items;
        debugPrint('***************FormBuilderState items: }');

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showJson) SizedBox(height: 600, child: JsonWidget(json: json ?? {"test": "Hello", "test2": "Hello2"})),
              Wrap(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<FormBuilderBloc>(context).add(FetchFormApiModelEvent());
                      json = formApiExample.toJson();
                    },
                    child: Text('Load JSON Example'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showJson = !showJson;
                      });
                    },
                    child: Text(showJson ? 'Hide JSON' : 'Show JSON'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final result = ConverterFromFormBuilderItems.convert(
                        '8620301b-0e90-4a3e-acd6-7873866b7f9d',
                        'Test Form',
                        state.items,
                      );
                      debugPrint('Converted FormApiModel: ${result.toJson()}');
                      setState(() {
                        json = result.toJson();
                      });
                    },
                    child: Text('Convert to FormApiModel'),
                  ),
                  ReorderButton(
                    onPressed: () {
                      BlocProvider.of<FormBuilderReorderCubit>(context).toggleReorderMode();
                    },
                  ),
                ],
              ),
              DropZone(showExpaned: items.isEmpty, isVisible: items.isEmpty || state.showDataZones),
              _buildFormControls(context, items: items, showDataZones: state.showDataZones),
            ],
          ),
        );
      },
    );
  }
}
