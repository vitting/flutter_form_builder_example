// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_builder_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FormBuilderItemCWProxy<T extends FormBuilderItemProperties> {
  FormBuilderItem<T> id(String id);

  FormBuilderItem<T> controlType(ControlTypesEnum controlType);

  FormBuilderItem<T> parentContainerId(String? parentContainerId);

  FormBuilderItem<T> columnId(String? columnId);

  FormBuilderItem<T> columnIndex(int? columnIndex);

  FormBuilderItem<T> properties(T? properties);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItem<T>(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItem<T>(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItem<T> call({
    String id,
    ControlTypesEnum controlType,
    String? parentContainerId,
    String? columnId,
    int? columnIndex,
    T? properties,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFormBuilderItem.copyWith(...)` or call `instanceOfFormBuilderItem.copyWith.fieldName(value)` for a single field.
class _$FormBuilderItemCWProxyImpl<T extends FormBuilderItemProperties>
    implements _$FormBuilderItemCWProxy<T> {
  const _$FormBuilderItemCWProxyImpl(this._value);

  final FormBuilderItem<T> _value;

  @override
  FormBuilderItem<T> id(String id) => call(id: id);

  @override
  FormBuilderItem<T> controlType(ControlTypesEnum controlType) =>
      call(controlType: controlType);

  @override
  FormBuilderItem<T> parentContainerId(String? parentContainerId) =>
      call(parentContainerId: parentContainerId);

  @override
  FormBuilderItem<T> columnId(String? columnId) => call(columnId: columnId);

  @override
  FormBuilderItem<T> columnIndex(int? columnIndex) =>
      call(columnIndex: columnIndex);

  @override
  FormBuilderItem<T> properties(T? properties) => call(properties: properties);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItem<T>(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItem<T>(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItem<T> call({
    Object? id = const $CopyWithPlaceholder(),
    Object? controlType = const $CopyWithPlaceholder(),
    Object? parentContainerId = const $CopyWithPlaceholder(),
    Object? columnId = const $CopyWithPlaceholder(),
    Object? columnIndex = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
  }) {
    return FormBuilderItem<T>(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      controlType:
          controlType == const $CopyWithPlaceholder() || controlType == null
          ? _value.controlType
          // ignore: cast_nullable_to_non_nullable
          : controlType as ControlTypesEnum,
      parentContainerId: parentContainerId == const $CopyWithPlaceholder()
          ? _value.parentContainerId
          // ignore: cast_nullable_to_non_nullable
          : parentContainerId as String?,
      columnId: columnId == const $CopyWithPlaceholder()
          ? _value.columnId
          // ignore: cast_nullable_to_non_nullable
          : columnId as String?,
      columnIndex: columnIndex == const $CopyWithPlaceholder()
          ? _value.columnIndex
          // ignore: cast_nullable_to_non_nullable
          : columnIndex as int?,
      properties: properties == const $CopyWithPlaceholder()
          ? _value.properties
          // ignore: cast_nullable_to_non_nullable
          : properties as T?,
    );
  }
}

extension $FormBuilderItemCopyWith<T extends FormBuilderItemProperties>
    on FormBuilderItem<T> {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFormBuilderItem.copyWith(...)` or `instanceOfFormBuilderItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FormBuilderItemCWProxy<T> get copyWith =>
      _$FormBuilderItemCWProxyImpl<T>(this);
}
