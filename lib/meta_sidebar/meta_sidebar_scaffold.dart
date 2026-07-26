import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/form_controls/form_text_field.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_controls_to_show_model.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_results_model.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';

class MetaSidebarScaffold extends StatefulWidget {
  final FormBuilderItem item;
  final void Function(FormBuilderItem?)? onDelete;
  const MetaSidebarScaffold({super.key, required this.item, this.onDelete});

  @override
  State<MetaSidebarScaffold> createState() => _MetaSidebarScaffoldState();
}

class _MetaSidebarScaffoldState extends State<MetaSidebarScaffold> {
  late MetaSidebarControlsToShowModel _fieldsToShow;
  late MetaSidebarResultsModel _propertiesAsMetaSidebarScaffoldResultsModel;
  late FormBuilderItem _item;
  bool _required = false;
  bool _defaultValueTrueFalse = false;

  @override
  void initState() {
    super.initState();
    _initValues();
  }

  @override
  void didUpdateWidget(covariant MetaSidebarScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.item != oldWidget.item) {
      _initValues();
    }
  }

  void _initValues() {
    _item = widget.item;
    _fieldsToShow = _item.metaSidebarScaffoldFieldsToShow;
    _propertiesAsMetaSidebarScaffoldResultsModel = _item.propertiesAsMetaSidebarScaffoldResultsModel;
    _required = _propertiesAsMetaSidebarScaffoldResultsModel.required ?? false;
    _defaultValueTrueFalse = _propertiesAsMetaSidebarScaffoldResultsModel.defaultValueTrueFalse ?? false;
  }

  void _updateItemProperties(BuildContext context, {required MetaSidebarResultsModel results}) {
    _item = _item.updateItemPropertiesBasedOnType(results);
    BlocProvider.of<FormBuilderBloc>(context).add(UpdateFormItemValuesEvent(item: _item));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Id: ${widget.item.id}', style: TextStyle(fontWeight: FontWeight.bold)),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              tooltip: 'Delete',
              icon: Icon(Icons.delete, color: Colors.blue),
              onPressed: () {
                widget.onDelete?.call(_item);
              },
            ),
          ],
        ),
        if (_fieldsToShow.showHeading) ...[
          SizedBox(height: 12),
          FormTextField(
            label: 'Heading',
            isFormRenderControl: true,
            isEnabled: true,
            initialValue: _propertiesAsMetaSidebarScaffoldResultsModel.heading,
            onChanged: (value) {
              _updateItemProperties(context, results: MetaSidebarResultsModel(heading: value));
            },
          ),
        ],
        if (_fieldsToShow.showLabel) ...[
          SizedBox(height: 12),
          FormTextField(
            label: 'Label',
            isFormRenderControl: true,
            isEnabled: true,
            initialValue: _propertiesAsMetaSidebarScaffoldResultsModel.label,
            onChanged: (value) {
              _updateItemProperties(context, results: MetaSidebarResultsModel(label: value));
            },
          ),
        ],
        if (_fieldsToShow.showHintText) ...[
          SizedBox(height: 12),
          FormTextField(
            label: 'Hint text',
            isFormRenderControl: true,
            isEnabled: true,
            initialValue: _propertiesAsMetaSidebarScaffoldResultsModel.hintText,
            onChanged: (value) {
              _updateItemProperties(context, results: MetaSidebarResultsModel(hintText: value));
            },
          ),
        ],
        if (_fieldsToShow.showDefaultValue) ...[
          SizedBox(height: 12),
          FormTextField(
            label: 'Default value',
            isFormRenderControl: true,
            isEnabled: true,
            initialValue: _propertiesAsMetaSidebarScaffoldResultsModel.defaultValue,
            onChanged: (value) {
              _updateItemProperties(context, results: MetaSidebarResultsModel(defaultValue: value));
            },
          ),
        ],
        if (_fieldsToShow.showDefaultValueTrueFalse) ...[
          SizedBox(height: 12),
          Material(
            color: Colors.transparent,
            child: CheckboxListTile(
              title: Text('Default value'),
              value: _defaultValueTrueFalse,
              onChanged: (value) {
                _updateItemProperties(context, results: MetaSidebarResultsModel(defaultValueTrueFalse: value));

                setState(() {
                  _defaultValueTrueFalse = value ?? false;
                });
              },
            ),
          ),
        ],
        if (_fieldsToShow.showRequired) ...[
          SizedBox(height: 12),
          Material(
            color: Colors.transparent,
            child: CheckboxListTile(
              title: Text('Required'),
              value: _required,
              onChanged: (value) {
                _updateItemProperties(context, results: MetaSidebarResultsModel(required: value));

                setState(() {
                  _required = value ?? false;
                });
              },
            ),
          ),
        ],
      ],
    );
  }
}
