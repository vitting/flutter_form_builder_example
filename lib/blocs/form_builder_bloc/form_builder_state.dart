import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

part 'form_builder_state.g.dart';

@CopyWith()
final class FormBuilderState extends Equatable {
  final List<FormBuilderItem> items;

  const FormBuilderState({required this.items});

  @override
  List<Object?> get props => [items];
}
