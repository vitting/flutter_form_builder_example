// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_builder_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FormBuilderInputItemCWProxy {
  FormBuilderInputItem id(String id);

  FormBuilderInputItem controlType(ControlTypesEnum controlType);

  FormBuilderInputItem containerId(String? containerId);

  FormBuilderInputItem columnId(String? columnId);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderInputItem(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderInputItem(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderInputItem call({
    String id,
    ControlTypesEnum controlType,
    String? containerId,
    String? columnId,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFormBuilderInputItem.copyWith(...)` or call `instanceOfFormBuilderInputItem.copyWith.fieldName(value)` for a single field.
class _$FormBuilderInputItemCWProxyImpl
    implements _$FormBuilderInputItemCWProxy {
  const _$FormBuilderInputItemCWProxyImpl(this._value);

  final FormBuilderInputItem _value;

  @override
  FormBuilderInputItem id(String id) => call(id: id);

  @override
  FormBuilderInputItem controlType(ControlTypesEnum controlType) =>
      call(controlType: controlType);

  @override
  FormBuilderInputItem containerId(String? containerId) =>
      call(containerId: containerId);

  @override
  FormBuilderInputItem columnId(String? columnId) => call(columnId: columnId);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderInputItem(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderInputItem(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderInputItem call({
    Object? id = const $CopyWithPlaceholder(),
    Object? controlType = const $CopyWithPlaceholder(),
    Object? containerId = const $CopyWithPlaceholder(),
    Object? columnId = const $CopyWithPlaceholder(),
  }) {
    return FormBuilderInputItem(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      controlType:
          controlType == const $CopyWithPlaceholder() || controlType == null
          ? _value.controlType
          // ignore: cast_nullable_to_non_nullable
          : controlType as ControlTypesEnum,
      containerId: containerId == const $CopyWithPlaceholder()
          ? _value.containerId
          // ignore: cast_nullable_to_non_nullable
          : containerId as String?,
      columnId: columnId == const $CopyWithPlaceholder()
          ? _value.columnId
          // ignore: cast_nullable_to_non_nullable
          : columnId as String?,
    );
  }
}

extension $FormBuilderInputItemCopyWith on FormBuilderInputItem {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFormBuilderInputItem.copyWith(...)` or `instanceOfFormBuilderInputItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FormBuilderInputItemCWProxy get copyWith =>
      _$FormBuilderInputItemCWProxyImpl(this);
}

abstract class _$FormBuilderColumnsItemCWProxy {
  FormBuilderColumnsItem id(String id);

  FormBuilderColumnsItem controlType(ControlTypesEnum controlType);

  FormBuilderColumnsItem columns(Map<String, List<FormBuilderItem>> columns);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderColumnsItem(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderColumnsItem(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderColumnsItem call({
    String id,
    ControlTypesEnum controlType,
    Map<String, List<FormBuilderItem>> columns,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFormBuilderColumnsItem.copyWith(...)` or call `instanceOfFormBuilderColumnsItem.copyWith.fieldName(value)` for a single field.
class _$FormBuilderColumnsItemCWProxyImpl
    implements _$FormBuilderColumnsItemCWProxy {
  const _$FormBuilderColumnsItemCWProxyImpl(this._value);

  final FormBuilderColumnsItem _value;

  @override
  FormBuilderColumnsItem id(String id) => call(id: id);

  @override
  FormBuilderColumnsItem controlType(ControlTypesEnum controlType) =>
      call(controlType: controlType);

  @override
  FormBuilderColumnsItem columns(Map<String, List<FormBuilderItem>> columns) =>
      call(columns: columns);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderColumnsItem(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderColumnsItem(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderColumnsItem call({
    Object? id = const $CopyWithPlaceholder(),
    Object? controlType = const $CopyWithPlaceholder(),
    Object? columns = const $CopyWithPlaceholder(),
  }) {
    return FormBuilderColumnsItem(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      controlType:
          controlType == const $CopyWithPlaceholder() || controlType == null
          ? _value.controlType
          // ignore: cast_nullable_to_non_nullable
          : controlType as ControlTypesEnum,
      columns: columns == const $CopyWithPlaceholder() || columns == null
          ? _value.columns
          // ignore: cast_nullable_to_non_nullable
          : columns as Map<String, List<FormBuilderItem>>,
    );
  }
}

extension $FormBuilderColumnsItemCopyWith on FormBuilderColumnsItem {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFormBuilderColumnsItem.copyWith(...)` or `instanceOfFormBuilderColumnsItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FormBuilderColumnsItemCWProxy get copyWith =>
      _$FormBuilderColumnsItemCWProxyImpl(this);
}
