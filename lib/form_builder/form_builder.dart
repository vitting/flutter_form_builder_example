import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_state.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_control_manage_container_cubit/form_builder_control_manage_container_cubit.dart';
import 'package:flutter_form_builder_example/converter/converter_to_form_api_items.dart';
import 'package:flutter_form_builder_example/converter/form_api_example.dart';
import 'package:flutter_form_builder_example/drop_zone/drop_zone.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/form_builder/form_control_manage_container.dart';
import 'package:flutter_form_builder_example/form_builder/form_builder_columns.dart';
import 'package:flutter_form_builder_example/form_builder/reorder_button.dart';
import 'package:flutter_form_builder_example/form_builder/show_id_button.dart';
import 'package:flutter_form_builder_example/form_controls/form_checkbox.dart';
import 'package:flutter_form_builder_example/form_controls/form_heading.dart';
import 'package:flutter_form_builder_example/form_controls/form_text_field.dart';
import 'package:flutter_form_builder_example/get_it/injection.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_controller.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_scaffold.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item_properties.dart';
import 'package:flutter_json/flutter_json.dart';

class FormBuilder extends StatefulWidget {
  const FormBuilder({super.key});

  @override
  State<FormBuilder> createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  Map<String, dynamic>? json;
  bool showJson = false;

  void _onDeleteItem(BuildContext context, FormBuilderItem? item) {
    if (item == null) return;
    final metaSidebarController = getIt<MetaSidebarController>();
    metaSidebarController.close();
    BlocProvider.of<FormBuilderBloc>(
      context,
    ).add(RemoveFormBuilderItemEvent(itemId: item.id, parentContainerId: item.parentContainerId, columnId: item.columnId));
  }

  void _onSelectedItem(FormBuilderItem? item) async {
    final metaSidebarController = getIt<MetaSidebarController>();
    if (item == null) {
      metaSidebarController.close();
      return;
    }

    await metaSidebarController.show(
      MetaSidebarScaffold(
        key: ValueKey(item.id),
        item: item,
        onDelete: (item) {
          _onDeleteItem(context, item);
        },
      ),
      title: item.controlTypeAsString,
    );

    formControlManageContainerController.setCurrentActiveControlId(null);
  }

  Widget _generateInput(FormBuilderItem item, int index) {
    switch (item.controlType) {
      case ControlTypesEnum.textField:
        final properties = item.getPropertiesAsTextField;
        return FormControlManageContainer(
          item: item,
          dragHandlerReOrderListIndex: index,
          onSelected: _onSelectedItem,
          child: FormTextField(
            label: properties.label ?? '',
            isFormRenderControl: true,
            isEnabled: false,
            isRequired: properties.required ?? false,
          ),
        );

      case ControlTypesEnum.numberField:
        final properties = item.getPropertiesAsNumberField;
        return FormControlManageContainer(
          item: item,
          dragHandlerReOrderListIndex: index,
          onSelected: _onSelectedItem,
          child: FormTextField(
            label: properties.label ?? '',
            isFormRenderControl: true,
            isEnabled: false,
            isRequired: properties.required ?? false,
          ),
        );
      case ControlTypesEnum.checkbox:
        final properties = item.getPropertiesAsCheckboxField;
        return FormControlManageContainer(
          item: item,
          dragHandlerReOrderListIndex: index,
          onSelected: _onSelectedItem,
          child: FormCheckbox(label: properties.label ?? '', isFormRenderControl: true, isEnabled: false),
        );
      case ControlTypesEnum.heading:
        final properties = item.getPropertiesAsHeader;
        return FormControlManageContainer(
          item: item,
          dragHandlerReOrderListIndex: index,
          onSelected: _onSelectedItem,
          child: FormHeading(text: properties.heading ?? ''),
        );
      default:
        return SizedBox.shrink();
    }
  }

  Widget _getControl(FormBuilderItem item, int index, {bool showDataZones = false}) {
    return switch (item.controlType) {
      ControlTypesEnum.textField ||
      ControlTypesEnum.numberField ||
      ControlTypesEnum.checkbox ||
      ControlTypesEnum.heading => _generateInput(item, index),
      ControlTypesEnum.columns => FormBuilderColumns(
        index: index,
        showDataZones: showDataZones,
        parentContainerItem: item,
        onSelected: _onSelectedItem,
        buildFormControls: (columnId) {
          final columnItems = (item.properties as FormBuilderItemPropertiesColumns).columns[columnId] ?? [];
          return _buildFormControls(context, items: columnItems, showDataZones: showDataZones);
        },
      ),
      _ => throw UnimplementedError(),
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
        if (state.formApiModel != null) {
          json = state.formApiModel?.toJson();
        }

        debugPrint('***************FormBuilderState items: }');

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showJson) ...[
                Padding(padding: const EdgeInsets.only(top: 8, left: 8), child: Text('Form id: ${state.formApiModel?.id} ')),
                Padding(padding: const EdgeInsets.only(left: 8), child: Text('Form name: ${state.formApiModel?.name} ')),
                SizedBox(height: 600, child: JsonWidget(json: json ?? {"test": "Hello", "test2": "Hello2"})),
              ],
              Wrap(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<FormBuilderBloc>(context).add(SaveFormEvent());
                    },
                    child: Text('Save Current Form'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<FormBuilderBloc>(context).add(LoadFormEvent());
                    },
                    child: Text('Load Current Form'),
                  ),
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
                      final result = ConverterToFormApiItems.convert(
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
                ],
              ),
              Wrap(
                children: [
                  ReorderButton(
                    onPressed: () {
                      BlocProvider.of<FormBuilderReorderCubit>(context).toggleReorderMode();
                    },
                  ),
                  ShowIdButton(
                    onPressed: () {
                      BlocProvider.of<FormBuilderReorderCubit>(context).toggleShowId();
                    },
                  ),
                ],
              ),
              Divider(),
              DropZone(showExpaned: items.isEmpty, isVisible: items.isEmpty || state.showDataZones),
              _buildFormControls(context, items: items, showDataZones: state.showDataZones),
            ],
          ),
        );
      },
    );
  }
}
