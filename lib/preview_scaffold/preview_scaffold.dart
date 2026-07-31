import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item_properties.dart';
import 'package:flutter_form_builder_example/preview_scaffold/preview_form_render.dart';

class PreviewScaffold extends StatelessWidget {
  final Iterable<FormBuilderItem<FormBuilderItemProperties>> items;
  const PreviewScaffold({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PreviewFormRender(items: items),
    );
  }
}
