part of 'form_builder_bloc.dart';

sealed class FormBuilderEvent extends Equatable {}

final class AddFormBuilderItemEvent extends FormBuilderEvent {
  final FormBuilderItem item;
  final String? parentId;
  final String? parentContainerId;
  final String? columnId;

  AddFormBuilderItemEvent({required this.item, this.parentId, this.parentContainerId, this.columnId});

  @override
  List<Object?> get props => [item, parentId, parentContainerId, columnId];
}

final class AddFormBuilderInputItemEvent extends FormBuilderEvent {
  final FormBuilderInputItem item;
  final String? parentId;
  final String? parentContainerId;
  final String? columnId;

  AddFormBuilderInputItemEvent({required this.item, this.parentId, this.parentContainerId, this.columnId});

  @override
  List<Object?> get props => [item, parentId, parentContainerId, columnId];
}

final class AddFormBuilderLayoutItemEvent extends FormBuilderEvent {
  final FormBuilderItem item;
  final String? parentId;
  final String? parentContainerId;
  final String? columnId;

  AddFormBuilderLayoutItemEvent({required this.item, this.parentId, this.parentContainerId, this.columnId});

  @override
  List<Object?> get props => [item, parentId, parentContainerId, columnId];
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
