import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/form_controls/form_text_field.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_results_model.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

typedef MetaSidebarScaffoldFieldsToShow = ({
  bool showDefaultValue,
  bool showDefaultValueTrueFalse,
  bool showLabel,
  bool showHeading,
  bool showHintText,
  bool showRequired,
});

class MetaSidebarScaffold extends StatelessWidget {
  final FormBuilderItem item;
  final void Function(FormBuilderItem?)? onDelete;
  const MetaSidebarScaffold({super.key, required this.item, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final fieldsToShow = item.metaSidebarScaffoldFieldsToShow;
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
            label: 'Heading',
            isFormRenderControl: true,
            isEnabled: true,
            onChanged: (value) {
              BlocProvider.of<FormBuilderBloc>(context).add(
                UpdateFormItemValuesEvent(
                  values: MetaSidebarResultsModel(item: item, heading: value),
                ),
              );
            },
          ),
        ],
        if (fieldsToShow.showLabel) ...[
          SizedBox(height: 12),
          FormTextField(
            label: 'Label',
            isFormRenderControl: true,
            isEnabled: true,
            onChanged: (value) {
              BlocProvider.of<FormBuilderBloc>(context).add(
                UpdateFormItemValuesEvent(
                  values: MetaSidebarResultsModel(item: item, label: value),
                ),
              );
            },
          ),
        ],
        if (fieldsToShow.showHintText) ...[
          SizedBox(height: 12),
          FormTextField(
            label: 'Hint text',
            isFormRenderControl: true,
            isEnabled: true,
            onChanged: (value) {
              BlocProvider.of<FormBuilderBloc>(context).add(
                UpdateFormItemValuesEvent(
                  values: MetaSidebarResultsModel(item: item, hintText: value),
                ),
              );
            },
          ),
        ],
        if (fieldsToShow.showDefaultValue) ...[
          SizedBox(height: 12),
          FormTextField(
            label: 'Default value',
            isFormRenderControl: true,
            isEnabled: true,
            onChanged: (value) {
              BlocProvider.of<FormBuilderBloc>(context).add(
                UpdateFormItemValuesEvent(
                  values: MetaSidebarResultsModel(item: item, defaultValue: value),
                ),
              );
            },
          ),
        ],
        if (fieldsToShow.showDefaultValueTrueFalse) ...[
          SizedBox(height: 12),
          Material(
            color: Colors.transparent,
            child: CheckboxListTile(
              title: Text('Default value'),
              value: false,
              onChanged: (value) {
                BlocProvider.of<FormBuilderBloc>(context).add(
                  UpdateFormItemValuesEvent(
                    values: MetaSidebarResultsModel(item: item, defaultValueTrueFalse: value),
                  ),
                );
              },
            ),
          ),
        ],
        if (fieldsToShow.showRequired) ...[
          SizedBox(height: 12),
          Material(
            color: Colors.transparent,
            child: CheckboxListTile(
              title: Text('Required'),
              value: false,
              onChanged: (value) {
                BlocProvider.of<FormBuilderBloc>(context).add(
                  UpdateFormItemValuesEvent(
                    values: MetaSidebarResultsModel(item: item, required: value),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
