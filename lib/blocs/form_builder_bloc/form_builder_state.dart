import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_model.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item_properties.dart';

part 'form_builder_state.g.dart';

@CopyWith()
final class FormBuilderState extends Equatable {
  final List<FormBuilderItem> items;
  final bool showDataZones;
  final bool showProgressIndicator;
  final FormApiModel? formApiModel;

  const FormBuilderState({
    required this.items,
    this.showDataZones = false,
    this.showProgressIndicator = false,
    this.formApiModel,
  });

  @override
  List<Object?> get props => [items, showDataZones, showProgressIndicator, formApiModel];
}
