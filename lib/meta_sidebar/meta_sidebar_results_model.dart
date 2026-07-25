import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

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
}
