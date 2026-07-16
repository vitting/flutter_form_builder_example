part of 'form_builder_bloc.dart';

sealed class FormBuilderEvent extends Equatable {}

final class AddFormBuilderItemEvent extends FormBuilderEvent {
  final FormBuilderItem item;
  final String? parentId;

  AddFormBuilderItemEvent({required this.item, this.parentId});

  @override
  List<Object?> get props => [item, parentId];
}

final class RemoveFormBuilderItemEvent extends FormBuilderEvent {
  final String itemId;

  RemoveFormBuilderItemEvent({required this.itemId});

  @override
  List<Object?> get props => [itemId];
}

final class ShowFormBuilderDataZonesEvent extends FormBuilderEvent {
  ShowFormBuilderDataZonesEvent();

  @override
  List<Object?> get props => [];
}

final class HideFormBuilderDataZonesEvent extends FormBuilderEvent {
  HideFormBuilderDataZonesEvent();

  @override
  List<Object?> get props => [];
}
