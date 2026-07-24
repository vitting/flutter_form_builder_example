import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/form_controls/form_text_field.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

class MetaSidebarScaffold extends StatelessWidget {
  final FormBuilderItem item;
  final void Function(FormBuilderItem?)? onDelete;
  const MetaSidebarScaffold({super.key, required this.item, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        SizedBox(height: 12),
        FormTextField(label: 'Heading', isFormRenderControl: true, isEnabled: true, onChanged: (value) {}),
        SizedBox(height: 12),
        FormTextField(label: 'Label', isFormRenderControl: true, isEnabled: true),
        SizedBox(height: 12),
        FormTextField(label: 'Hint text', isFormRenderControl: true, isEnabled: true),
        SizedBox(height: 12),
        FormTextField(label: 'Default value', isFormRenderControl: true, isEnabled: true),
        SizedBox(height: 12),
        Material(
          color: Colors.transparent,
          child: CheckboxListTile(title: Text('Default value'), value: false, onChanged: (value) {}),
        ),
        SizedBox(height: 12),
        Material(
          color: Colors.transparent,
          child: CheckboxListTile(title: Text('Required'), value: false, onChanged: (value) {}),
        ),
      ],
    );
  }
}
