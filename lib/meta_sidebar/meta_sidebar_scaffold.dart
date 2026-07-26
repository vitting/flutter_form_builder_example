import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/form_controls/form_text_field.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_results_model.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';

class MetaSidebarScaffold extends StatelessWidget {
  final FormBuilderItem item;
  final void Function(FormBuilderItem?)? onDelete;
  const MetaSidebarScaffold({super.key, required this.item, this.onDelete});

  void _updateItemProperties(BuildContext context, MetaSidebarResultsModel results) {
    BlocProvider.of<FormBuilderBloc>(context).add(UpdateFormItemValuesEvent(values: results));
  }

  @override
  Widget build(BuildContext context) {
    final fieldsToShow = item.metaSidebarScaffoldFieldsToShow;
    final propertiesAsMetaSidebarScaffoldResultsModel = item.propertiesAsMetaSidebarScaffoldResultsModel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Id: ${item.id}', style: TextStyle(fontWeight: FontWeight.bold)),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              tooltip: 'Delete',
              icon: Icon(Icons.delete, color: Colors.blue),
              onPressed: () {
                onDelete?.call(item);
              },
            ),
          ],
        ),
        if (fieldsToShow.showHeading) ...[
          SizedBox(height: 12),
          FormTextField(
            key: ValueKey('${item.id}_heading'),
            label: 'Heading',
            isFormRenderControl: true,
            isEnabled: true,
            initialValue: propertiesAsMetaSidebarScaffoldResultsModel.heading,
            onChanged: (value) {
              _updateItemProperties(context, MetaSidebarResultsModel(item: item, heading: value));
            },
          ),
        ],
        if (fieldsToShow.showLabel) ...[
          SizedBox(height: 12),
          FormTextField(
            key: ValueKey('${item.id}_label'),
            label: 'Label',
            isFormRenderControl: true,
            isEnabled: true,
            initialValue: propertiesAsMetaSidebarScaffoldResultsModel.label,
            onChanged: (value) {
              _updateItemProperties(context, MetaSidebarResultsModel(item: item, label: value));
            },
          ),
        ],
        if (fieldsToShow.showHintText) ...[
          SizedBox(height: 12),
          FormTextField(
            key: ValueKey('${item.id}_hintText'),
            label: 'Hint text',
            isFormRenderControl: true,
            isEnabled: true,
            initialValue: propertiesAsMetaSidebarScaffoldResultsModel.hintText,
            onChanged: (value) {
              _updateItemProperties(context, MetaSidebarResultsModel(item: item, hintText: value));
            },
          ),
        ],
        if (fieldsToShow.showDefaultValue) ...[
          SizedBox(height: 12),
          FormTextField(
            key: ValueKey('${item.id}_defaultValue'),
            label: 'Default value',
            isFormRenderControl: true,
            isEnabled: true,
            initialValue: propertiesAsMetaSidebarScaffoldResultsModel.defaultValue,
            onChanged: (value) {
              _updateItemProperties(context, MetaSidebarResultsModel(item: item, defaultValue: value));
            },
          ),
        ],
        if (fieldsToShow.showDefaultValueTrueFalse) ...[
          SizedBox(height: 12),
          Material(
            color: Colors.transparent,
            child: CheckboxListTile(
              key: ValueKey('${item.id}_defaultValueTrueFalse'),
              title: Text('Default value'),
              value: propertiesAsMetaSidebarScaffoldResultsModel.defaultValueTrueFalse ?? false,
              onChanged: (value) {
                _updateItemProperties(context, MetaSidebarResultsModel(item: item, defaultValueTrueFalse: value));
              },
            ),
          ),
        ],
        if (fieldsToShow.showRequired) ...[
          SizedBox(height: 12),
          Material(
            color: Colors.transparent,
            child: CheckboxListTile(
              key: ValueKey('${item.id}_required'),
              title: Text('Required'),
              value: propertiesAsMetaSidebarScaffoldResultsModel.required ?? false,
              onChanged: (value) {
                _updateItemProperties(context, MetaSidebarResultsModel(item: item, required: value));
              },
            ),
          ),
        ],
      ],
    );
  }
}
