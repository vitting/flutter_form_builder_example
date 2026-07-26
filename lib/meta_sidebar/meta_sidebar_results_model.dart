import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item_properties.dart';

part 'meta_sidebar_results_model.g.dart';

@CopyWith()
class MetaSidebarResultsModel extends Equatable {
  final FormBuilderItem item;
  final String? heading;
  final String? label;
  final String? hintText;
  final String? defaultValue;
  final bool? defaultValueTrueFalse;
  final bool? required;

  const MetaSidebarResultsModel({
    required this.item,
    this.heading,
    this.label,
    this.hintText,
    this.defaultValue,
    this.defaultValueTrueFalse,
    this.required,
  });

  @override
  List<Object?> get props => [item, heading, label, hintText, defaultValue, defaultValueTrueFalse, required];

  @override
  bool get stringify => true;
}
