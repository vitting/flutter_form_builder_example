part of 'form_builder_bloc.dart';

sealed class FormBuilderEvent extends Equatable {}

final class AddFormBuilderItemEvent extends FormBuilderEvent {
  final FormBuilderItem item;
  final String? parentId;
  final String? parentContainerId;
  final String? columnId;
  final int? columnIndex;

  AddFormBuilderItemEvent({required this.item, this.parentId, this.parentContainerId, this.columnId, this.columnIndex});

  @override
  List<Object?> get props => [item, parentId, parentContainerId, columnId, columnIndex];
}

final class AddSimpleFormBuilderItemEvent<T> extends FormBuilderEvent {
  final T item;
  final String? parentId;

  AddSimpleFormBuilderItemEvent({required this.item, this.parentId});

  @override
  List<Object?> get props => [item, parentId];
}

final class AddSimpleFormBuilderItemIntoColumnEvent<T> extends FormBuilderEvent {
  final T item;
  final String? parentId;
  final String parentContainerId;
  final String columnId;
  final int? columnIndex;

  AddSimpleFormBuilderItemIntoColumnEvent({
    required this.item,
    this.parentId,
    required this.parentContainerId,
    required this.columnId,
    this.columnIndex,
  });

  @override
  List<Object?> get props => [item, parentId, parentContainerId, columnId, columnIndex];
}

final class AddFormBuilderLayoutColumnItemEvent extends FormBuilderEvent {
  final FormBuilderColumnsItem item;
  final String? parentId;
  final String? parentContainerId;
  final String? columnId;
  final int? columnIndex;

  AddFormBuilderLayoutColumnItemEvent({
    required this.item,
    this.parentId,
    this.parentContainerId,
    this.columnId,
    this.columnIndex,
  });

  @override
  List<Object?> get props => [item, parentId, parentContainerId, columnId, columnIndex];
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
